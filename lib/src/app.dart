import 'package:flutter/material.dart';
import 'package:healthy/src/pages/coins_page.dart';
import 'package:healthy/src/pages/login_page.dart';
import 'package:healthy/src/pages/register_page.dart';
import 'package:healthy/src/pages/start_page.dart';
import 'package:healthy/src/pages/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      debugShowCheckedModeBanner: false,
      initialRoute: 'start_page',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => StartPage(),
        'register_page': (BuildContext context) => RegisterPage(),
        'login_page': (BuildContext context) => LoginPage(),
        'coins_page': (BuildContext context) => CoinsPage(),
        'welcome_page': (BuildContext context) => WelcomePage(),
      },
    );
  }
}
