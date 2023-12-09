import 'package:cbt_exam/data/datasources/auth_local_datarsource.dart';
import 'package:cbt_exam/data/models/response/materi_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';

class MateriRemoteDataSource {
  final String url = Variables.baseUrl;

  Future<Either<String, MateriResponseModel>> getAllMateri() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(Uri.parse("$url/api/materials"), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${authData.accessToken}"
    });
    if (response.statusCode == 200) {
      return Right(
        MateriResponseModel.fromJson(response.body),
      );
    } else {
      return const Left("Error Get Materi Data");
    }
  }
}
