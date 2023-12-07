// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cbt_exam/core/constants/colors.dart';
import 'package:cbt_exam/core/extensions/build_context_ext.dart';

import '../widgets/header_profile.dart';
import '../widgets/profile_options.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: HeaderProfile(),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              height: context.deviceHeight,
              width: context.deviceWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ProfileOptions(
                    options: "Edit Profile",
                    button: () {},
                  ),
                  ProfileOptions(
                    options: "Help",
                    button: () {},
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Text(
                    "General",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ProfileOptions(
                    options: "Privacy & Policy",
                    button: () {},
                  ),
                  ProfileOptions(
                    options: "Term of Service",
                    button: () {},
                  ),
                  ProfileOptions(
                    options: "Rate App",
                    button: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
