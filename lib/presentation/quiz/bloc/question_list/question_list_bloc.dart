// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cbt_exam/data/models/response/exam_response_model.dart';

part 'question_list_bloc.freezed.dart';
part 'question_list_event.dart';
part 'question_list_state.dart';

class QuestionListBloc extends Bloc<QuestionListEvent, QuestionListState> {
  QuestionListBloc() : super(const _Initial()) {
    on<_GetQuestionList>((event, emit) {
      emit(const _Loading());
      emit(
        _Success(event.data, 0, event.data.length > 1),
      );
    });
    on<_NextQuestion>((event, emit) {
      final currentState = state as _Success;
      emit(const _Loading());
      emit(_Success(currentState.data, currentState.currentIndex + 1,
          currentState.data.length > currentState.currentIndex + 2));
    });
  }
}
