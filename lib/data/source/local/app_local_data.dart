import '../../../domain/models/models.dart';
import 'local_data.dart';

class AppLocalData extends LocalData {
  Future<void> saveUser({required AppUser user}) async {
    String userJson = user.toRawJson();
    await super.saveString(key: 'user', value: userJson);
  }

  Future<AppUser?> getUser() async {
    String? userJson = await super.readString(key: 'user');
    if (userJson != null && userJson.isNotEmpty) {
      return AppUser.fromRawJson(userJson);
    } else {
      return null;
    }
  }

  Future<void> saveToken({required String token}) async {
    await super.saveString(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    String? token = await super.readString(key: 'token');
    if (token != null && token.isNotEmpty) {
      return token;
    } else {
      return null;
    }
  }
}
