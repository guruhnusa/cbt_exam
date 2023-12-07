// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class ButtonMateri extends StatelessWidget {
  final VoidCallback button;
  final IconData icon;
  const ButtonMateri({
    Key? key,
    required this.button,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: button,
        child: Container(
          height: 50,
          width: 50,
          color: AppColors.white,
          child: Icon(icon, size: 33, color: AppColors.primary),
        ),
      ),
    );
  }
}
