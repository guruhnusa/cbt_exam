import 'package:cbt_exam/core/components/custom_scaffold.dart';
import 'package:cbt_exam/core/constants/colors.dart';
import 'package:cbt_exam/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

import '../widgets/button_materi.dart';

class DetailMateriPage extends StatefulWidget {
  const DetailMateriPage({super.key});

  @override
  State<DetailMateriPage> createState() => _DetailMateriPageState();
}

class _DetailMateriPageState extends State<DetailMateriPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBarTitle: const Text("Detail Materi"),
        body: ListView(
          children: [
            Container(
              height: context.deviceHeight / 1.8,
              width: context.deviceWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                image: DecorationImage(
                    image: NetworkImage("https://i.pravatar.cc/200"),
                    fit: BoxFit.cover),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "Lorem ipsum dolor sit amet, consecte  ",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam accumsan sem ut ligula tempus, a vehicula dui ullamcorper. Nunc eget lacinia neque. Vivamus eget augue nec urna scelerisque vehicula. Quisque feugiat dui eu ex tincidunt,",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        floatingActionButton: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, AppColors.primary.withOpacity(0.4)],
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
        ));
  }
}
