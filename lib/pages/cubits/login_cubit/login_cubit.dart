import 'package:chatapp/pages/cubits/login_cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginIntial());



  Future<void> loginUser({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

          emit(LoginSuccess());
    } on Exception catch (e) {
       emit(LoginFailure());
    }
  }



}