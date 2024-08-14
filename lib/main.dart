import 'package:bricoun/screens/auth/get_started.dart';
import 'package:bricoun/screens/auth/login.dart';
import 'package:bricoun/screens/auth/login_success.dart';
import 'package:bricoun/screens/auth/sign_up.dart';
import 'package:bricoun/screens/home/home.dart';
import 'package:bricoun/screens/pages/hasil.dart';
import 'package:bricoun/screens/pages/soal_page.dart';
import 'package:bricoun/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SelectedDateProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      routes: {
        '/stepper': (context) => const GetStartedPage(),
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => const Home(),
        '/loginSuc': (context) => const LoginSuccessPage(),
        '/question': (context) => const QuestionPage(),
      },
      theme: ThemeData(
          fontFamily: "Poppins",
          primarySwatch: Colors.lightBlue,
          primaryColor: Colors.lightBlue),
      initialRoute: '/stepper',
    );
  }
}
