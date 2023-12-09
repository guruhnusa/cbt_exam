import 'test_type.dart';

class QuizModel {
  final String image;
  final String name;
  final String type;
  final String description;
  final int duration;
  final String category;

  QuizModel({
    required this.image,
    required this.name,
    required this.type,
    required this.description,
    required this.duration,
    required this.category,
  });

  TestType get testType => TestType.fromValue(type);
}
