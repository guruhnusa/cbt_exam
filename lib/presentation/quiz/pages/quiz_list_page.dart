import 'package:cbt_exam/presentation/quiz/bloc/create_exam/create_exam_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/custom_scaffold.dart';
import '../bloc/exam_by_category/exam_by_category_bloc.dart';
import '../models/quiz_model.dart';
import '../widgets/quiz_card.dart';

class QuizListPage extends StatefulWidget {
  const QuizListPage({super.key});

  @override
  State<QuizListPage> createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  @override
  void initState() {
    context.read<ExamByCategoryBloc>().add(
          const ExamByCategoryEvent.getExamByCategory('Verbal'),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<QuizModel> datas = [
      QuizModel(
        image: Assets.images.quizCategory.path,
        name: 'Tes Angka',
        type: 'Multiple Choice',
        description:
            'Tes angka adalah suatu jenis tes psikometri yang dirancang untuk mengukur kemampuan individu dalam memahami, menganalisis, dan menyelesaikan masalah yang melibatkan angka dan matematika.',
        duration: 30,
        category: 'Numeric',
      ),
      QuizModel(
        image: Assets.images.quizCategory.path,
        name: 'Tes Logika',
        type: 'Multiple Choice',
        description:
            'Tes logika adalah metode evaluasi yang digunakan untuk mengukur kemampuan seseorang dalam berpikir secara logis, analitis, dan rasional',
        duration: 30,
        category: 'Logika',
      ),
      QuizModel(
        image: Assets.images.quizCategory.path,
        name: 'Tes Verbal',
        type: 'Multiple Choice',
        description:
            'Tes verbal adalah suatu metode evaluasi yang digunakan untuk mengukur kemampuan seseorang dalam menggunakan dan memahami bahasa lisan atau tertulis.',
        duration: 30,
        category: 'Verbal',
      ),
    ];

    return CustomScaffold(
      appBarTitle: const Text('Quiz'),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Kategori TPA',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(AssetImage(Assets.icons.sort.path)),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          BlocConsumer<ExamByCategoryBloc, ExamByCategoryState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                notfound: () {
                  context
                      .read<CreateExamBloc>()
                      .add(const CreateExamEvent.createExam());
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(child: Text("Error"));
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (message) => Center(child: Text(message)),
                notfound: () {
                  return Center(
                      child: BlocBuilder<CreateExamBloc, CreateExamState>(
                    builder: (context, state) {
                      return state.maybeWhen(orElse: () {
                        return const Center(child: CircularProgressIndicator());
                      }, success: () {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: datas.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 18.0),
                          itemBuilder: (context, index) => QuizCard(
                            data: datas[index],
                          ),
                        );
                      });
                    },
                  ));
                },
                success: (data) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: datas.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 18.0),
                    itemBuilder: (context, index) => QuizCard(
                      data: datas[index],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
