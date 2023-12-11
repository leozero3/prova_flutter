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

  // a funcao getUser() nao esta sendo usada nesta versao,
  Future<void> getUser() async {
    final response = await http.get(_url);
    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);
      for (var user in users) {}
    } else {
      print('Falha na requisição: ${response.statusCode}');
    }
  }

  Future<void> loginUser() async {
    final response = await http.post(
      _url,
      body: jsonEncode({
        'user_name': loginController.text,
        'password': passwordController.text,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Dados do usuário enviados com sucesso!');
    } else {
      print(
          'Falha ao enviar dados do usuário. Código de resposta: ${response.statusCode}');
    }
  }

  void showPopup(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
