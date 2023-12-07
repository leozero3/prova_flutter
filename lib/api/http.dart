import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prova_flutter/model/user_model.dart';

class MockApi {
  final _url =
      Uri.parse('https://6572228ed61ba6fcc0146eb1.mockapi.io/api/v1/users');

  UserModel? userModel;

  Future<void> fetchData() async {
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      // Sucesso na requisição
      final List<dynamic> users = jsonDecode(response.body);
      for (var user in users) {
        print(
            'Usuário: ${user['user_name']}, Senha: ${user['password']}, ID: ${user['id']}');
      }
    } else {
      // Falha na requisição
      print('Falha na requisição: ${response.statusCode}');
    }
  }

  Future<void> postUser() async {
    final response = await http.post(
      _url,
      body: jsonEncode(userModel!.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Dados do usuário enviados com sucesso!');
    } else {
      print(
          'Falha ao enviar dados do usuário. Código de resposta: ${response.statusCode}');
    }
  }
}
