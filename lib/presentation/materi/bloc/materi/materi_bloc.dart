// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cbt_exam/data/datasources/materi_remote_datasource.dart';
import 'package:cbt_exam/data/models/response/materi_response_model.dart';

part 'materi_bloc.freezed.dart';
part 'materi_event.dart';
part 'materi_state.dart';

class MateriBloc extends Bloc<MateriEvent, MateriState> {
  MateriRemoteDataSource materiRemoteDataSource;
  MateriBloc(
    this.materiRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetAllMateri>(
      (event, emit) async {
        emit(const _Loading());
        final response = await materiRemoteDataSource.getAllMateri();
        response.fold(
          (message) => emit(
            _Error(message),
          ),
          (data) => emit(
            _Success(data),
          ),
        );
      },
    );
  }
}
