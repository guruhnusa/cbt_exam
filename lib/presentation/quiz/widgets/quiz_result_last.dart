// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:cbt_exam/presentation/quiz/bloc/calculate_score/calculate_score_bloc.dart';

import '../../../core/constants/colors.dart';
import 'result_value.dart';

class QuizResultLast extends StatefulWidget {
  final String category;
  const QuizResultLast({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<QuizResultLast> createState() => _QuizResultLastState();
}

class _QuizResultLastState extends State<QuizResultLast> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hasil Tes ${widget.category}',
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
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
          child: BlocBuilder<CalculateScoreBloc, CalculateScoreState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const SizedBox();
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                success: (data) {
                  return Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Semua Tes',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 18.0),
                            ResultValue.correct(data.correctAnswer),
                            const SizedBox(height: 18.0),
                            ResultValue.wrong(data.incorrectAnswer),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            CircularStepProgressIndicator(
                                totalSteps:
                                    data.correctAnswer + data.incorrectAnswer,
                                currentStep: data.correctAnswer,
                                stepSize: 10,
                                selectedColor: AppColors.green,
                                unselectedColor: AppColors.primary,
                                padding: 0,
                                width: 140,
                                height: 140,
                                selectedStepSize: 24,
                                unselectedStepSize: 24,
                                roundedCap: (_, __) => true,
                                child: Center(
                                  child: Text(
                                    '${data.score}',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
