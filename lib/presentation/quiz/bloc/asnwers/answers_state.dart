part of 'answers_bloc.dart';

@freezed
class AnswersState with _$AnswersState {
  const factory AnswersState.initial() = _Initial;
  const factory AnswersState.loading() = _Loading;
  const factory AnswersState.success() = _Success;
  const factory AnswersState.error(String message) = _Error;
}
