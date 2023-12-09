import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbt_exam/core/extensions/build_context_ext.dart';
import 'package:cbt_exam/data/models/response/materi_response_model.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_scaffold.dart';
import '../../../core/constants/colors.dart';
import '../widgets/materi_button.dart';

class MateriDetailPage extends StatelessWidget {
  final Materi data;
  const MateriDetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: const Text('Materi TPA'),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30.0),
            ),
            child: CachedNetworkImage(
              imageUrl: data.image,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              width: context.deviceWidth,
              height: 470.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
            child: Column(
              children: [
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14.0),
                Text(
                  data.content,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 100.0),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 100,
            width: context.deviceWidth,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(207, 255, 255, 255),
                AppColors.primary.withOpacity(0.4)
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonMateri(button: () {}, icon: Icons.star_border_outlined),
                SizedBox(
                  height: 48,
                  width: 167,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Read More",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary),
                    ),
                  ),
                ),
                ButtonMateri(button: () {}, icon: Icons.file_upload_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
