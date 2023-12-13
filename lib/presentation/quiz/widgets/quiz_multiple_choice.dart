import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cbt_exam/presentation/quiz/bloc/question_list/question_list_bloc.dart';

import '../../../core/components/buttons.dart';
import '../../../core/constants/colors.dart';
import '../bloc/asnwers/answers_bloc.dart';
import '../bloc/calculate_score/calculate_score_bloc.dart';
import 'answer_choices.dart';

class QuizMultipleChoice extends StatefulWidget {
  final String category;
  const QuizMultipleChoice({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<QuizMultipleChoice> createState() => _QuizMultipleChoiceState();
}

class _QuizMultipleChoiceState extends State<QuizMultipleChoice> {
  String selectedAnswer = '';
  String theAnswer = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionListBloc, QuestionListState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            // ignore: prefer_const_constructors
            return SizedBox();
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          error: (message) {
            return Center(child: Text(message));
          },
          success: (data, currentIndex, isNext) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadows: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.14),
                        blurRadius: 17,
                        offset: const Offset(0, 8),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Text(
                    data[currentIndex].question,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 34.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnswerChoices(
                      label: data[currentIndex].answerA,
                      isSelected: selectedAnswer == data[currentIndex].answerA,
                      onChanged: (value) {
                        setState(() {
                          selectedAnswer = value;
                          theAnswer = "a";
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    AnswerChoices(
                      label: data[currentIndex].answerB,
                      isSelected: selectedAnswer == data[currentIndex].answerB,
                      onChanged: (value) {
                        setState(() {
                          selectedAnswer = value;
                          theAnswer = "b";
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    AnswerChoices(
                      label: data[currentIndex].answerC,
                      isSelected: selectedAnswer == data[currentIndex].answerC,
                      onChanged: (value) {
                        setState(() {
                          selectedAnswer = value;
                          theAnswer = "c";
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    AnswerChoices(
                      label: data[currentIndex].answerD,
                      isSelected: selectedAnswer == data[currentIndex].answerD,
                      onChanged: (value) {
                        setState(() {
                          selectedAnswer = value;
                          theAnswer = "d";
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 38.0),
                theAnswer.isEmpty
                    ? Button.filled(
                        disabled: true,
                        onPressed: () {},
                        label: 'Selanjutnya',
                      )
                    : isNext
                        ? Button.filled(
                            onPressed: () {
                              context.read<AnswersBloc>().add(
                                    AnswersEvent.answerExam(
                                        questionId: data[currentIndex].id,
                                        answer: theAnswer),
                                  );
                              context.read<QuestionListBloc>().add(
                                    const QuestionListEvent.nextQuestion(),
                                  );
                              setState(() {
                                theAnswer = '';
                              });
                            },
                            label: 'Selanjutnya',
                          )
                        : Button.filled(
                            onPressed: () {
                              context.read<AnswersBloc>().add(
                                    AnswersEvent.answerExam(
                                        questionId: data[currentIndex].id,
                                        answer: theAnswer),
                                  );
                              context.read<CalculateScoreBloc>().add(
                                    CalculateScoreEvent.calculateScore(
                                        widget.category),
                                  );
                            },
                            label: 'Selesai',
                          )
              ],
            );
          },
        );
      },
    );
  }
}
