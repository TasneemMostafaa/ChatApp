abstract class LoginState {}

class LoginIntial extends LoginState{}
class LoginSuccess extends LoginState{}
class LoginLoading extends LoginState{}
class LoginFailure extends LoginState{
  String errorMessage;
  LoginFailure({required this.errorMessage});
}
