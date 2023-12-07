import 'package:cbt_exam/core/constants/variables.dart';
import 'package:cbt_exam/data/datasources/auth_local_datarsource.dart';
import 'package:cbt_exam/data/models/request/login_request_model.dart';
import 'package:cbt_exam/data/models/request/register_request_model.dart';
import 'package:cbt_exam/data/models/response/auth_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final String url = Variables.baseUrl;

  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel model) async {
    final response = await http.post(
      Uri.parse("$url/api/register"),
      body: model.toJson(),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse("$url/api/logout"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${authData.accessToken}"
      },
    );

    if (response.statusCode == 200) {
      return const Right("Success Logout");
    } else {
      return const Left("Not Success Logout");
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel model) async {
    final response = await http.post(
      Uri.parse("$url/api/login"),
      body: model.toJson(),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }
}
