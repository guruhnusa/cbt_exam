part of 'answers_bloc.dart';

@freezed
class AnswersEvent with _$AnswersEvent {
  const factory AnswersEvent.started() = _Started;
  const factory AnswersEvent.answerExam({
    required int questionId,
    required String answer,
  }) = _AnswerExam;
}
