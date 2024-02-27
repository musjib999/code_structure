import 'package:template/data/source/remote/remote_data.dart';

import '../../domain/domain.dart';

class AuthRepo extends AuthAbstract {
  static String authUrl = '';
  static String appUrl = '';
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final _api = RemoteData();

  @override
  Future<String> login(
      {required String email, required String password}) async {
    try {
      final response = await _api.postData(
        url: "$authUrl/users/login",
        data: {
          'email': email,
          'password': password,
        },
      );
      final token = response['token'];
      return token;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> verifyOTP({required String email, required String otp}) async {
    try {
      final response = await _api.postData(
        url: "$authUrl/users/verify-otp",
        data: {
          'email': email,
          'otp': otp,
        },
      );
      final token = response['token'];
      return token;
    } catch (e) {
      rethrow;
    }
  }

  Future updateProfile(
      {String? firstName,
      String? lastName,
      String? email,
      String? phone,
      String? dob,
      String? gender,
      required String token}) async {
    try {
      final response = await _api.updateData(
        url: '$appUrl/users',
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "phone": phone,
          "dateOfBirth": dob,
        },
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      AppUser user = AppUser.fromJson(response['data']);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<AppUser> getUser({required String token}) async {
    try {
      final response = await _api.getData(
        url: '$appUrl/users',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      AppUser user = AppUser.fromJson(response['data']);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  // Future<String?> signInWithGoogle() async {
  //   try {
  //     GoogleAuthProvider googleProvider = GoogleAuthProvider();

  //     UserCredential user = await _auth.signInWithPopup(googleProvider);
  //     final token = await user.user!.getIdToken();
  //     return token;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<RegistrationResponse?> confirmSignInWithGoogle(
  //     {required String token}) async {
  //   try {
  //     final response = await _api.postData(
  //       url: '$authUrl/users/firebase/auth',
  //       headers: {'Authorization': 'Bearer $token'},
  //     );
  //     AppUser user = AppUser.fromJson(response['User']);
  //     token = response['token'];
  //     _local.saveToken(token: response['token']);
  //     _local.saveUser(user: user);
  //     return RegistrationResponse(
  //       isNewUser: response['isNewuser'],
  //       token: token,
  //       user: user,
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future changePassword(
      {required String oldPassword, required String newPassword}) async {}

  @override
  Future forgotPassword({required String email}) async {}
}
