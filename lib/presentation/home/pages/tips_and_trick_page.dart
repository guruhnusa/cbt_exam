import 'package:cbt_exam/presentation/home/bloc/content/content_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_scaffold.dart';

class TipsAndTricksPage extends StatefulWidget {
  const TipsAndTricksPage({super.key});

  @override
  State<TipsAndTricksPage> createState() => _TipsAndTricksPageState();
}

class _TipsAndTricksPageState extends State<TipsAndTricksPage> {
  @override
  void initState() {
    context.read<ContentBloc>().add(const ContentEvent.getContentById('2'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: const Text('Tips dan Trik'),
      body: BlocBuilder<ContentBloc, ContentState>(
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () {
                return const Center(
                  child: Text("Error"),
                );
              },
              success: (data) {
                return ListView(
                  padding: const EdgeInsets.all(30.0),
                  children: [
                    Text(
                      data.data[0].content,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text(message)));
        },
      ),
    );
  }
}
