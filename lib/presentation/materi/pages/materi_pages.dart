import 'package:cbt_exam/core/components/custom_scaffold.dart';
import 'package:cbt_exam/core/extensions/build_context_ext.dart';
import 'package:cbt_exam/presentation/materi/pages/detail_materi_pages.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class MateriPages extends StatefulWidget {
  const MateriPages({super.key});

  @override
  State<MateriPages> createState() => _MateriPagesState();
}

class _MateriPagesState extends State<MateriPages> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: const Text("Materi"),
      showBackButton: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: () {
                  context.push(const DetailMateriPage());
                },
                child: Container(
                  width: context.deviceWidth,
                  height: context.deviceWidth - 160,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 180,
                              child: Text(
                                "Lorem ipsum dolor sit amet, Lorem ipsum dolor",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              child: Image.network(
                                'https://i.pravatar.cc/200',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "17 Hours Ago",
                              style: TextStyle(color: AppColors.darkGrey),
                            ),
                            Icon(
                              Icons.more_horiz_rounded,
                              color: AppColors.darkGrey,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam accumsan sem ut ligu .Nullam accumsan sem ut liguNullam accumsan sem ut ligu",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
