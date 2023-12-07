part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            controller: loginController,
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
            controller: passwordController,
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
            child: OutlinedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xFF44BD6E),
                ),
              ),
              onPressed: () {
                MockApi().fetchData();
                print('=======================');
                MockApi().postUser();
                print('=======================');
                MockApi().fetchData();
                print('=======================');
                Navigator.of(context).pushNamed('/info-page');
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
  TxtFormField({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: null,
      obscureText: obscureText,
      // enabled: enabled,
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
