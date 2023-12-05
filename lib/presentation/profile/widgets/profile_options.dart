import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

// ignore: must_be_immutable
class ProfileOptions extends StatelessWidget {
  ProfileOptions({
    Key? key,
    required this.options,
    required this.button,
  }) : super(key: key);

  final String options;
  VoidCallback button;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      title: Text(options,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.primary,
            fontWeight: FontWeight.w400,
          )),
      trailing: IconButton(
          onPressed: button,
          icon: const Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 27,
            color: AppColors.primary,
          )),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    );
  }
}
