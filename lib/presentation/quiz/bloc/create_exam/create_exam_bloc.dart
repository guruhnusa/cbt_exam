// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cbt_exam/data/datasources/exam_remote_datasource.dart';

part 'create_exam_bloc.freezed.dart';
part 'create_exam_event.dart';
part 'create_exam_state.dart';

class CreateExamBloc extends Bloc<CreateExamEvent, CreateExamState> {
  ExamRemoteDataSource examRemoteDataSource;
  CreateExamBloc(
    this.examRemoteDataSource,
  ) : super(const _Initial()) {
    on<CreateExamEvent>((event, emit) async {
      emit(const _Loading());
      final response = await examRemoteDataSource.createExam();
      response.fold(
        (l) => emit(
          _Error(l),
        ),
        (r) => emit(
          const _Success(),
        ),
      );
    });
  }
}
