import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ScholarApp());
}
 
  
class ScholarApp extends StatelessWidget {
  const ScholarApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        ChatPage.id: (context) => ChatPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
  
}
