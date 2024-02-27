abstract class AuthAbstract {
  Future login({required String email, required String password});

  Future changePassword(
      {required String oldPassword, required String newPassword});

  Future forgotPassword({required String email});
}
