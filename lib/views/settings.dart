import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sesi_esporte/views/account_page.dart';
import 'package:sesi_esporte/views/dark_controller.dart';
import 'package:sesi_esporte/views/login_page.dart';

class Settings extends StatefulWidget {
  final String email;
  const Settings({Key? key, required this.email}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              SettingsGroup(
                title: 'Geral',
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(8),
                    color: Colors.orange,
                    child: ListTile(
                      onTap: () {},
                      title: const Text(
                        'Nicollas Marinho',
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://a.espncdn.com/combiner/i?img=%2Fphoto%2F2021%2F0607%2Fr864237_1296x729_16%2D9.jpg"),
                      ),
                    ),
                  ),
                  AccountPage(),
                  buildNotifications(),
                  //buildTheme(context),
                  SwitchListTile(
                      title: Text('Tema'),
                      secondary:
                          const Icon(Icons.dark_mode, color: Colors.orange),
                      value: DarkController.instance.isDarkMode,
                      onChanged: (value) {
                        setState(() {});
                        DarkController.instance.changeTheme();
                      }),
                  buildFeedback(),
                  buildLogout(context),
                ],
              ),
            ],
          ),
        ),
      );
}

Widget buildNotifications() {
  return SimpleSettingsTile(
    title: 'Notificações',
    subtitle: '',
    leading: const Icon(
      Icons.notifications,
      color: Colors.orange,
    ),
    onTap: () {},
  );
}

Widget buildFeedback() {
  return SimpleSettingsTile(
    title: 'Ajuda e Sujestões',
    subtitle: '',
    leading: const Icon(
      Icons.support_agent,
      color: Colors.orange,
    ),
    onTap: () {},
  );
}

Widget buildLogout(context) {
  return SimpleSettingsTile(
    title: 'logout',
    subtitle: '',
    leading: const Icon(
      Icons.logout,
      color: Colors.orange,
    ),
    onTap: () {},
  );
}
/*
Widget myLayoutWidget() {
  // wrap everything in a purple container
  return Container(
    margin: EdgeInsets.all(16.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.orange,
      border: Border.all(),
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
    ),

    // column of three rows
    child: Column(
      // this makes the column height hug its content
      mainAxisSize: MainAxisSize.min,
      children: [
        // first row
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.favorite,
                color: Colors.green,
              ),
            ),
            Text(
              'BEAMS',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        // second row (single item)
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 0,
          ),
          child: Text(
            'Send programmable push notifications to iOS and Android devices with delivery and open rate tracking built in.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),

        // third row
        Row(
          children: [
            Text(
              'EXPLORE BEAMS',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
*/