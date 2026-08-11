
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

          emit(LoginSuccess());}
          on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                                   emit(LoginFailure(errorMessage: 'no user found for that email. '));

                         } else if (ex.code == 'invalid-credential') {
                                   emit(LoginFailure(errorMessage: 'wrong email or password '));
                         }
                        
    }  catch (e) {
       emit(LoginFailure(errorMessage: "Something went wrong"));
    }
  }



}