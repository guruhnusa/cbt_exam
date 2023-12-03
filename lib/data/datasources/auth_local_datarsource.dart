import 'package:cbt_exam/data/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  Future<void> saveAuthData(AuthResponseModel model) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(
      'auth_data',
      model.toJson(),
    );
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }

  Future<AuthResponseModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final authData = pref.getString("auth_data");
    return AuthResponseModel.fromJson(authData!);
  }
}
