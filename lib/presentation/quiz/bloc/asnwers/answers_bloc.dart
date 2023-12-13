// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cbt_exam/data/datasources/exam_remote_datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answers_bloc.freezed.dart';
part 'answers_event.dart';
part 'answers_state.dart';

class AnswersBloc extends Bloc<AnswersEvent, AnswersState> {
  ExamRemoteDataSource examRemoteDataSource;
  AnswersBloc(
    this.examRemoteDataSource,
  ) : super(const _Initial()) {
    on<_AnswerExam>((event, emit) async {
      emit(const _Loading());
      final response = await examRemoteDataSource.answerExam(
        event.questionId,
        event.answer,
      );

      response.fold(
        (error) => emit(
          _Error(error),
        ),
        (success) => emit(
          const _Success(),
        ),
      );
    });
  }
}
