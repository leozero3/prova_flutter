import 'package:flutter/material.dart';
import 'package:prova_flutter/pages/info_page/info_screen.dart';
import 'pages/login_page/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/info-page': (context) => const InfoPage(),
      },
    );
  }
}
