import 'package:flutter/material.dart';
import 'package:prova_flutter/api/http.dart';
import 'package:url_launcher/url_launcher.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Center(child: _LoginForm()),
              GestureDetector(
                onTap: () async {
                  await launchUrl(
                    Uri.https('www.google.com.br'),
                    mode: LaunchMode.platformDefault,
                  );
                },
                child: const SizedBox(
                  child: Text(
                    'Política de Privacidade',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
