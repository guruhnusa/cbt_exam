import 'package:cbt_exam/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(const _Initial()) {
    on<_Logout>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDataSource().logout();
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
