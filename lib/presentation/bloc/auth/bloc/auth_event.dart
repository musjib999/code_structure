part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class AuthLogin extends AuthEvent {
  const AuthLogin({required this.email, required this.password});
  final String email;
  final String password;
  @override
  List<Object?> get props => [email, password];
}

class AuthVerifyOtp extends AuthEvent {
  const AuthVerifyOtp({required this.otp, required this.email});
  final String otp;
  final String email;

  @override
  List<Object?> get props => [otp, email];
}

class AuthGetProfile extends AuthEvent {
  const AuthGetProfile({required this.token});
  final String token;

  @override
  List<Object?> get props => [token];
}

class AuthUserUpdate extends AuthEvent {
  const AuthUserUpdate({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.token,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String token;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        gender,
        token,
      ];
}
