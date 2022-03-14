import 'package:flutter/material.dart';
import 'package:healthy/src/pages/coins_page.dart';
import 'package:healthy/src/pages/doc_page.dart';
import 'package:healthy/src/pages/login_page.dart';
import 'package:healthy/src/pages/profile_page.dart';
import 'package:healthy/src/pages/register_page.dart';
import 'package:healthy/src/pages/start_page.dart';
import 'package:healthy/src/pages/welcome_page.dart';
import 'package:healthy/src/pages/nurse_page.dart';
import 'package:healthy/src/pages/fisio_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const StartPage(),
        'register_page': (BuildContext context) => const RegisterPage(),
        'login_page': (BuildContext context) => const LoginPage(),
        'coins_page': (BuildContext context) => const CoinsPage(),
        'welcome_page': (BuildContext context) => WelcomePage(),
        'doc_page': (BuildContext context) => const DocPage(),
        'nurse_page': (BuildContext context) => NursePage(),
        'fisio_page': (BuildContext context) => FisioPage(),
        'profile_page': (BuildContext context) => const ProfilePage(),
      },
    );
  }
}
