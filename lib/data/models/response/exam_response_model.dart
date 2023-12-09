import 'dart:convert';

class ExamResponseModel {
  String message;
  final int timer;
  List<Datum> data;

  ExamResponseModel({
    required this.message,
    required this.data,
    required this.timer,
  });

  factory ExamResponseModel.fromJson(String str) =>
      ExamResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamResponseModel.fromMap(Map<String, dynamic> json) =>
      ExamResponseModel(
        message: json["message"],
        timer: json["timer"] ?? 0,
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  int id;
  String question;
  String category;
  String answerA;
  String answerB;
  String answerC;
  String answerD;

  Datum({
    required this.id,
    required this.question,
    required this.category,
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        question: json["question"],
        category: json["category"],
        answerA: json["answer_a"],
        answerB: json["answer_b"],
        answerC: json["answer_c"],
        answerD: json["answer_d"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "question": question,
        "category": category,
        "answer_a": answerA,
        "answer_b": answerB,
        "answer_c": answerC,
        "answer_d": answerD,
      };
}