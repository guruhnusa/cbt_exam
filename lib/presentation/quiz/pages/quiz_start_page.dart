import 'package:cbt_exam/core/extensions/build_context_ext.dart';

import 'package:cbt_exam/presentation/quiz/bloc/calculate_score/calculate_score_bloc.dart';
import 'package:cbt_exam/presentation/quiz/bloc/exam_by_category/exam_by_category_bloc.dart';
import 'package:cbt_exam/presentation/quiz/bloc/question_list/question_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/custom_scaffold.dart';
import '../../../core/constants/colors.dart';
import '../models/quiz_model.dart';
import '../widgets/countdown_timer.dart';
import '../widgets/quiz_multiple_choice.dart';
import 'quiz_finish_page.dart';

class QuizStartPage extends StatefulWidget {
  final QuizModel data;

  const QuizStartPage({
    super.key,
    required this.data,
  });

  @override
  State<QuizStartPage> createState() => _QuizStartPageState();
}

class _QuizStartPageState extends State<QuizStartPage> {
  @override
  void initState() {
    context.read<ExamByCategoryBloc>().add(
          ExamByCategoryEvent.getExamByCategory(widget.data.category),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: Text(widget.data.name),
      actions: [
        Assets.icons.clock.image(width: 24.0),
        const SizedBox(width: 8.0),
        BlocListener<ExamByCategoryBloc, ExamByCategoryState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: (data) {
                context.read<QuestionListBloc>().add(
                      QuestionListEvent.getQuestionList(data.data),
                    );
              },
            );
          },
          child: BlocBuilder<ExamByCategoryBloc, ExamByCategoryState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(child: Text("Error Get Timer"));
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                success: (data) {
                  return CountdownTimer(
                    duration: data.timer,
                    onTimerCompletion: (timeRemaining) {
                      context.pushReplacement(
                        QuizFinishPage(
                          data: widget.data,
                          timeRemaining: 0,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
        IconButton(
          onPressed: () {
            context.pushReplacement(QuizFinishPage(
              data: widget.data,
              timeRemaining: 0,
            ));
          },
          icon: const Icon(
            Icons.done,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 24.0),
      ],
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          const Text(
            'Pertanyaan',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          BlocListener<CalculateScoreBloc, CalculateScoreState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (data) {
                  context.pushReplacement(
                    QuizFinishPage(
                      data: widget.data,
                      timeRemaining: 0,
                    ),
                  );
                },
              );
            },
            child: BlocBuilder<QuestionListBloc, QuestionListState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const SizedBox();
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  success: (data, currentIndex, isNext) {
                    return Row(
                      children: [
                        Flexible(
                          child: LinearProgressIndicator(
                            value: (currentIndex + 1) / data.length,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Text(
                          '${currentIndex + 1}/${data.length}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),
          QuizMultipleChoice(category: widget.data.category),
        ],
      ),
    );
  }
}
