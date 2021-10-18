import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: TextFormField(
                  onChanged: (text) {
                    email = text;
                  },
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
              ),
              const SizedBox(
                width: 30,
                height: 30,
              ),
              TextFormField(
                onChanged: (text) {
                  password = text;
                },
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
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  labelText: 'Senha',
                ),
              ),
              SizedBox(
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
                          Navigator.of(context).pushNamed('/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
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
                    SizedBox(
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
    );
  }
}
