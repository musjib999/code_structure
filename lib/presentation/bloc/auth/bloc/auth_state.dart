part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  authenticated,
  error,
  logout,
  verifyOtp,
  userUpdated,
  getProfile,
}

extension AuthStatusX on AuthStatus {
  bool get isInitial => this == AuthStatus.initial;
  bool get isAuthenticated => this == AuthStatus.authenticated;
  bool get isVerifyOtp => this == AuthStatus.verifyOtp;
  bool get isUserUpdated => this == AuthStatus.userUpdated;
  bool get isGetProfile => this == AuthStatus.getProfile;

  bool get isError => this == AuthStatus.error;
  bool get isLoading => this == AuthStatus.loading;
  bool get isLogout => this == AuthStatus.logout;
}

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.initial,
    this.exception,
    this.token,
    this.user,
  });

  final AppUser? user;
  final String? token;
  final String? exception;
  final AuthStatus status;

  AuthState copyWith({
    AppUser? user,
    AuthStatus? status,
    String? exception,
    String? token,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
      exception: exception ?? this.exception,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [exception, status, user, token];
}
