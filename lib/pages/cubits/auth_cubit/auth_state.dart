part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
class LoginIntial extends AuthState{}
class LoginSuccess extends AuthState{}
class LoginLoading extends AuthState{}
class LoginFailure extends AuthState{
  String errorMessage;
  LoginFailure({required this.errorMessage});
}
class RegisterSuccess extends AuthState{}
class RegisterLoading extends AuthState{}
class RegisterFailure extends AuthState{
  String errorMessage;
  RegisterFailure({required this.errorMessage});
}
