// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cbt_exam/data/datasources/content_remote_datasource.dart';
import 'package:cbt_exam/data/models/response/content_response_model.dart';

part 'content_bloc.freezed.dart';
part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentRemoteDataSource contentRemoteDataSource;
  ContentBloc(
    this.contentRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetContentById>((event, emit) async {
      emit(const _Loading());
      final response = await contentRemoteDataSource.getContentById(event.id);
      response.fold(
        (error) => emit(
          _Error(error),
        ),
        (data) => emit(
          _Success(data),
        ),
      );
    });
  }
}
