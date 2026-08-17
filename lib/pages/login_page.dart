import 'package:chatapp/constants.dart';
import 'package:chatapp/helper/show_snack_bar.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/cubits/auth_cubit/auth_cubit.dart';
import 'package:chatapp/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  static String id = 'LoginPage';

  bool isLoading = false;
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is LoginLoading){
          isLoading =true;
        }
        else if(state is LoginSuccess){
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
          isLoading=false;
        }
        else if(state is LoginFailure){
          showSnackBar(context, state.errorMessage  );
          isLoading=false;
        }
      },
      builder:(context, state)=> ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    'assets/images/image2.jpg',
                    width: 150,
                    height: 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholar Chat',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: 'Email',
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    obscureText: true,
                    hintText: 'Password',
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Sign In',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).loginUser(email: email!, password: password!);
                        
                      } else {}
                    },
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'don\'t have an account? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: Text(
                          ' Sign Up ',
                          style: TextStyle(color: Color(0xffc7ede6)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
