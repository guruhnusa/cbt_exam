part of 'calculate_score_bloc.dart';

@freezed
class CalculateScoreEvent with _$CalculateScoreEvent {
  const factory CalculateScoreEvent.started() = _Started;
  const factory CalculateScoreEvent.calculateScore(String category) =
      _CalculateScore;
}
