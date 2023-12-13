import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

enum AnswerCorrection { none, selected }

class AnswerChoices extends StatefulWidget {
  final String label;
  final void Function(String value) onChanged;
  final bool isSelected;
  final AnswerCorrection answerCorrection;

  const AnswerChoices({
    super.key,
    required this.label,
    required this.onChanged,
    this.isSelected = false,
    this.answerCorrection = AnswerCorrection.none,
  });

  @override
  State<AnswerChoices> createState() => _AnswerChoicesState();
}

class _AnswerChoicesState extends State<AnswerChoices> {
  @override
  Widget build(BuildContext context) {
    // if (answerCorrection == AnswerCorrection.selected) {
    //   return Container(
    //     padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    //     decoration: const BoxDecoration(
    //       borderRadius: BorderRadius.all(Radius.circular(20)),
    //       color: AppColors.lightGreen,
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(
    //           label,
    //           style: const TextStyle(
    //             fontSize: 20,
    //             fontWeight: FontWeight.w600,
    //           ),
    //         ),
    //         Container(
    //           width: 24,
    //           height: 24,
    //           decoration: const ShapeDecoration(
    //             color: AppColors.white,
    //             shape: OvalBorder(
    //               side: BorderSide(width: 1, color: AppColors.lightGreen),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    return GestureDetector(
      onTap: () => widget.onChanged(widget.label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: widget.isSelected ? AppColors.lightGreen : AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: ShapeDecoration(
                color: widget.isSelected ? AppColors.lightRed : AppColors.white,
                shape: OvalBorder(
                  side: BorderSide(
                      width: widget.isSelected ? 0 : 2,
                      color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
