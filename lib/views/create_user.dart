import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateUserForm extends StatefulWidget {
  const CreateUserForm({Key? key}) : super(key: key);

  @override
  _CreateUserFormState createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  String nomeUsuario = '';
  String cpf = '';
  String email = '';
  String telefone = '';
  String createPassword = '';
  String confirmPassword = '';

  TextEditingController _cpf = TextEditingController();

  bool _checkBoxVal = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 100, left: 18, right: 18, bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (text) {
                          nomeUsuario = text;
                        },
                        validator: (nomeUsuario) {
                          if (nomeUsuario == null || nomeUsuario.isEmpty) {
                            return 'Preencha o campo nome ';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            labelText: 'Nome Completo'),
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                      ),
                      TextFormField(
                        controller: _cpf,
                        onChanged: (text) {
                          cpf = text;
                        },
                        validator: (cpf) {
                          if (!GetUtils.isCpf(cpf) ||
                              cpf == null ||
                              cpf.isEmpty) {
                            return 'CPF Incorreto';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfInputFormatter()
                        ],
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_pin_sharp),
                            border: OutlineInputBorder(),
                            labelText: 'CPF'),
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                      ),
                      TextFormField(
                        onChanged: (text) {
                          email = text;
                        },
                        validator: (email) =>
                            email!.isEmpty || !email.contains('@')
                                ? "Email inválido"
                                : null,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                            labelText: 'Email'),
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                      ),
                      TextFormField(
                        onChanged: (text) {
                          telefone = text;
                        },
                        validator: (telefone) {
                          if (telefone == null || telefone.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                            labelText: 'Telefone'),
                      ),
                      SizedBox(
                        width: 30,
                        height: 70,
                      ),
                      TextFormField(
                        onChanged: (text) {
                          createPassword = text;
                        },
                        validator: (createPassword) {
                          if (createPassword == null ||
                              createPassword.isEmpty) {
                            return 'Campo Obrigatório';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.vpn_key),
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                      ),
                      TextFormField(
                        onChanged: (text) {
                          confirmPassword = text;
                        },
                        validator: (confirmPassword) {
                          if (confirmPassword != createPassword) {
                            return 'As senhas não conferem';
                          }
                          if (createPassword == null ||
                              createPassword.isEmpty) {
                            return 'Campo Obrigatório';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.vpn_key),
                          border: OutlineInputBorder(),
                          labelText: 'Confirmação de senha',
                        ),
                      ),
                      Row(
                        children: [
                          SingleChildScrollView(
                              child: Checkbox(
                            onChanged: (bool? value) {
                              if (value != null) {
                                setState(() => this._checkBoxVal = value);
                              }
                            },
                            value: _checkBoxVal,
                          )),
                          Text('Li e aceito os termos e condições.')
                        ],
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_checkBoxVal == false) {
                        showBottomSheet<String>(
                          context: context,
                          builder: (BuildContext context) => Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.black12)))),
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Usuário Criado"),
                        backgroundColor: Colors.greenAccent,
                      ));
                      Navigator.of(context).pushNamed('/');
                    } else if (createPassword != confirmPassword ||
                        _checkBoxVal == false) {}
                  },
                  child: const Text("Criar Usuário"),
                  color: Colors.orange[600],
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
