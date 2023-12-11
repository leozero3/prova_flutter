import 'package:flutter/material.dart';
import 'package:prova_flutter/api/http.dart';
import 'package:prova_flutter/pages/widgets/privacy_policy.dart';
part 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF1D4E62), Color(0xFF2D958E)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: _LoginForm(),
              ),
              PrivacyPolicy(),
            ],
          ),
        ),
      ),
    );
  }
}
