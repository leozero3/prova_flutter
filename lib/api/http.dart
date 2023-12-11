import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prova_flutter/model/user_model.dart';

class MockApi {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _url =
      Uri.parse('https://6572228ed61ba6fcc0146eb1.mockapi.io/api/v1/users');

  UserModel? userModel;

  void dispose() {
    loginController.dispose();
    passwordController.dispose();
  }

  void showPopup(BuildContext context, String message) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    if (scaffoldMessenger.mounted) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> loginUser(BuildContext context) async {
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);

      bool userExists = users.any((user) =>
          user['user_name'] == loginController.text &&
          user['password'] == passwordController.text);

      if (userExists) {
        showPopup(context, 'Usuário autenticado com sucesso!');
        await Future.delayed(const Duration(seconds: 2));
        Navigator.of(context).pushNamed('/info-page');
      } else {
        await http.post(
          _url,
          body: jsonEncode({
            'user_name': loginController.text,
            'password': passwordController.text,
          }),
          headers: {'Content-Type': 'application/json'},
        );

        showPopup(context, 'Novo usuário criado com sucesso!');
        await Future.delayed(const Duration(seconds: 2));

        Navigator.of(context).pushNamed('/info-page');
      }
    } else {
      showPopup(
        context,
        'Falha na requisição: ${response.statusCode}',
      );
    }
  }
}
