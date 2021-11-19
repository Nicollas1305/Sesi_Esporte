import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sesi_esporte/views/home_page.dart';
import 'package:sesi_esporte/views/settings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  String email = '';
  String password = '';

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  Future<ByteData> _login() async {
    return await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF063970),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/Logo.png'),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                  onChanged: (text) {
                    email = text;
                  },
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    labelText: 'Usuário',
                  ),
                ),
                const SizedBox(
                  width: 30,
                  height: 30,
                ),
                TextFormField(
                  onChanged: (text) {
                    password = text;
                  },
                  style: const TextStyle(color: Colors.white),
                  obscureText: _obscured,
                  focusNode: textFieldFocusNode,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.vpn_key_rounded),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: GestureDetector(
                        onTap: _toggleObscured,
                        child: Icon(_obscured
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded),
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    labelText: 'Senha',
                  ),
                ),
                const SizedBox(
                  width: 30,
                  height: 30,
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Expanded(
                          child: RaisedButton(
                        onPressed: () {
                          if (email == 'Nicollas@gmail.com' &&
                              password == '12345') {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/home', (Route<dynamic> route) => false);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("login inválido"),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          }
                        },
                        child: const Text("Entrar"),
                        color: Colors.orange[600],
                        textColor: Colors.white,
                      )),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/createuser');
                        },
                        child: const Text("Criar Usuário"),
                        color: Colors.orange[600],
                        textColor: Colors.white,
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
