part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  MockApi controller = MockApi();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Usuário',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TxtFormField(
            controller: controller.loginController,
            validator: (userLogin) {
              if (userLogin!.isEmpty) {
                return 'Campo Obrigatorio';
              } else if (userLogin.length < 2 && userLogin.length > 20) {
                return 'Numero de caracteres proibidos, de 2 a 20 caracteres';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Senha',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          TxtFormField(
            controller: controller.passwordController,
            validator: (password) {
              if (password!.isEmpty) {
                return 'Campo obrigatório';
              } else if (password.length < 2 && password.length > 20) {
                return 'Numero de caracteres proibidos, de 2 a 20 caracteres';
              } else if (RegExp(r'^[a-zA-Z0-9]+$').hasMatch(password)) {
                return null;
              } else {
                return 'Senha não pode conter caracteres especiais';
              }
            },
            obscureText: true,
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 35),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 50,
            child: FilledButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xFF44BD6E),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.loginUser(context);
                }
              },
              child: const Text('Entrar',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class TxtFormField extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? keyboardType;
  bool obscureText;
  Widget? prefixIcon;
  String? Function(String?)? validator;

  TxtFormField({
    super.key,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: 20,
      style: const TextStyle(
        fontSize: 22,
      ),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: prefixIcon,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
