import 'package:cbt_exam/data/datasources/exam_remote_datasource.dart';
import 'package:cbt_exam/data/models/response/exam_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_by_category_event.dart';
part 'exam_by_category_state.dart';
part 'exam_by_category_bloc.freezed.dart';

class ExamByCategoryBloc
    extends Bloc<ExamByCategoryEvent, ExamByCategoryState> {
  ExamRemoteDataSource examRemoteDataSource;
  ExamByCategoryBloc(this.examRemoteDataSource) : super(const _Initial()) {
    on<_GetExamByCategory>(
      (event, emit) async {
        emit(const _Loading());
        final response =
            await examRemoteDataSource.getExamByCategory(event.category);
        response.fold(
          (message) => emit(
            _Error(message),
          ),
          (r) {
            if (r.data.isEmpty) {
              return emit(
                const _NotFound(),
              );
            } else {
              return emit(
                _Success(r),
              );
            }
          },
        );
      },
    );
  }
}
