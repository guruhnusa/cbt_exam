import 'package:cbt_exam/data/datasources/exam_remote_datasource.dart';
import 'package:cbt_exam/data/models/response/get_score_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculate_score_event.dart';
part 'calculate_score_state.dart';
part 'calculate_score_bloc.freezed.dart';

class CalculateScoreBloc
    extends Bloc<CalculateScoreEvent, CalculateScoreState> {
  ExamRemoteDataSource examRemoteDataSource;
  CalculateScoreBloc(this.examRemoteDataSource) : super(const _Initial()) {
    on<_CalculateScore>((event, emit) async {
      emit(const _Loading());
      final response =
          await examRemoteDataSource.getScoreByCategory(event.category);
      response.fold((error) {
        emit(_Error(error));
      }, (data) {
        emit(_Success(data));
      });
    });
  }
}
