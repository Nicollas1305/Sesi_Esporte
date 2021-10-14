import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get_utils/get_utils.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Configurações da Conta',
      subtitle: 'Privacidade, Segurança, Idioma',
      leading: Icon(
        Icons.person,
        color: Colors.orange,
      ),
      child: SettingsScreen(
        title: 'Configurações da Conta',
        children: [
          buildPrivacy(context),
          buildSecurity(context),
          buildAccountInfo(context),
        ],
      ),
    );
  }
}

Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
      title: 'Privacidade',
      subtitle: '',
      leading: Icon(
        Icons.lock,
        color: Colors.orange,
      ),
      onTap: () {},
    );

Widget buildSecurity(BuildContext context) => SimpleSettingsTile(
      title: 'Segurança',
      subtitle: '',
      leading: Icon(
        Icons.security,
        color: Colors.orange,
      ),
      onTap: () {},
    );

Widget buildAccountInfo(BuildContext context) => SimpleSettingsTile(
      title: 'Informações da conta',
      subtitle: '',
      leading: Icon(
        Icons.text_snippet,
        color: Colors.orange,
      ),
      onTap: () {},
    );
