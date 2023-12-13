part of 'calculate_score_bloc.dart';

@freezed
class CalculateScoreState with _$CalculateScoreState {
  const factory CalculateScoreState.initial() = _Initial;
  const factory CalculateScoreState.loading() = _Loading;
  const factory CalculateScoreState.success(GetScoreResponseModel data) = _Success;
  const factory CalculateScoreState.error(String message) = _Error;
}
