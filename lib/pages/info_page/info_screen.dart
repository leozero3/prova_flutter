import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  TextEditingController textoController = TextEditingController();
  List<String> informacoes = ObservableList<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Captura de Informações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textoController,
              decoration: InputDecoration(labelText: 'Digite seu texto'),
              onSubmitted: (text) {
                _salvarInformacao(text);
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: informacoes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(informacoes[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _excluirInformacao(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _salvarInformacao(String texto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    informacoes.add(texto);
    prefs.setStringList('informacoes', informacoes);
    textoController.clear();
    setState(() {});
  }

  void _excluirInformacao(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    informacoes.removeAt(index);
    prefs.setStringList('informacoes', informacoes);
    setState(() {});
  }
}
