import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cbt_exam/data/datasources/auth_remote_datasource.dart';
import 'package:cbt_exam/data/models/request/login_request_model.dart';
import 'package:cbt_exam/data/models/response/auth_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDataSource().login(event.data);
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
