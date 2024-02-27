import 'package:template/data/repositories/auth_repo.dart';
import 'package:template/data/source/local/local.dart';
import 'package:template/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _auth = AuthRepo();
  final _localData = AppLocalData();
  AuthBloc() : super(const AuthState()) {
    on<AuthLogin>(_onLogin);
    on<AuthVerifyOtp>(_onVerifyOtp);
    on<AuthUserUpdate>(_onUserUpdate);
    on<AuthGetProfile>(_onGetProfile);
  }

  void _onLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final token = await _localData.getToken();
      final user = await _localData.getUser();
      if (token != null && user != null) {
        emit(
          state.copyWith(
            status: AuthStatus.authenticated,
            token: token,
            user: user,
          ),
        );
      } else {
        final token = await _auth.login(
          email: event.email,
          password: event.password,
        );
        _localData.saveToken(token: token);
        emit(
          state.copyWith(
            status: AuthStatus.authenticated,
            token: token,
            user: dummyUser,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(exception: e.toString(), status: AuthStatus.error));
    }
  }

  void _onVerifyOtp(AuthVerifyOtp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final token = await _auth.verifyOTP(
        email: event.email,
        otp: event.otp.toString(),
      );
      _localData.saveToken(token: token);
      emit(
        state.copyWith(status: AuthStatus.verifyOtp, token: token),
      );
    } catch (e) {
      emit(state.copyWith(exception: e.toString(), status: AuthStatus.error));
    }
  }

  void _onUserUpdate(AuthUserUpdate event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await _auth.updateProfile(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        gender: event.gender,
        token: event.token,
      );
      final user = await _auth.getUser(
        token: event.token,
      );
      _localData.saveUser(user: user);
      emit(
        state.copyWith(status: AuthStatus.userUpdated, user: user),
      );
    } catch (e) {
      emit(state.copyWith(exception: e.toString(), status: AuthStatus.error));
    }
  }

  void _onGetProfile(AuthGetProfile event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final user = await _auth.getUser(
        token: event.token,
      );
      _localData.saveUser(user: user);
      emit(
        state.copyWith(status: AuthStatus.getProfile, user: user),
      );
    } catch (e) {
      emit(state.copyWith(exception: e.toString(), status: AuthStatus.error));
    }
  }
}
