import 'package:cbt_exam/core/constants/variables.dart';
import 'package:cbt_exam/data/datasources/auth_local_datarsource.dart';
import 'package:cbt_exam/data/models/response/exam_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ExamRemoteDataSource {
  final String url = Variables.baseUrl;

  Future<Either<String, ExamResponseModel>> getExamByCategory(
      String category) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final response = await http.get(
      Uri.parse("$url/api/get-question-exam?category=$category"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${authData.accessToken}"
      },
    );
    if (response.statusCode == 200) {
      return Right(
        ExamResponseModel.fromJson(response.body),
      );
    } else {
      return const Left("Error Get Exams");
    }
  }

  Future<Either<String, String>> createExam() async {
    final authData = await AuthLocalDataSource().getAuthData();

    final response = await http.post(
      Uri.parse("$url/api/create-exam"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${authData.accessToken}"
      },
    );
    if (response.statusCode == 200) {
      return const Right("Success Create Exams");
    } else {
      return const Left("Error Create Exams");
    }
  }
}
