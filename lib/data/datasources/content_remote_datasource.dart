import 'package:cbt_exam/core/constants/variables.dart';
import 'package:cbt_exam/data/datasources/auth_local_datarsource.dart';
import 'package:cbt_exam/data/models/response/content_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ContentRemoteDataSource {
  final String url = Variables.baseUrl;

  Future<Either<String, ContentResponseModel>> getContentById(String id) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final response = await http.get(
      Uri.parse("$url/api/contents?id=$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${authData.accessToken}"
      },
    );
    if (response.statusCode == 200) {
      return Right(
        ContentResponseModel.fromJson(response.body),
      );
    } else {
      return const Left("Error Get Content Data");
    }
  }
}
