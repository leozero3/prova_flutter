import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/pages/info_page/info_store.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => InfoPageStore(),
      child: _InfoPageContent(),
    );
  }
}

class _InfoPageContent extends StatefulWidget {
  @override
  _InfoPageContentState createState() => _InfoPageContentState();
}

class _InfoPageContentState extends State<_InfoPageContent> {
  late InfoPageStore _infoScreenStore;

  @override
  void initState() {
    super.initState();
    _infoScreenStore = Provider.of<InfoPageStore>(context, listen: false);
    _infoScreenStore.loadSavedData();
  }

  @override
  void dispose() {
    _infoScreenStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1D4E62), Color(0xFF2D958E)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: TextFormField(
                              controller: _infoScreenStore.titleController,
                              maxLength: 20,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Digite o título',
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Confirmação'),
                                          content: const Text(
                                              'Tem certeza que deseja excluir?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancelar'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                _infoScreenStore.clearFields();
                                                _infoScreenStore.saveData();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Confirmar'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _infoScreenStore.textController,
                                maxLines: null,
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                decoration: const InputDecoration(
                                  hintText: 'Digite seu texto',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Observer(
                    builder: (context) {
                      return GestureDetector(
                        onTap: _infoScreenStore.isSaving
                            ? null
                            : () async {
                                if (_infoScreenStore
                                        .titleController.text.isEmpty ||
                                    _infoScreenStore
                                        .textController.text.isEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Aviso'),
                                        content: const Text(
                                            'Preencha todos os campos antes de salvar.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Fecha o popup
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  _infoScreenStore.saveData();
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Sucesso'),
                                        content: const Text(
                                            'Os dados foram salvos com sucesso.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Salvar Texto',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(
                        Uri.https('www.google.com'),
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
