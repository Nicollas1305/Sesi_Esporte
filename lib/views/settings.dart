import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sesi_esporte/views/account_page.dart';
import 'package:sesi_esporte/views/dark_controller.dart';
import 'package:sesi_esporte/views/login_page.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

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
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      //height: 200,
                      child: ListTile(
                        leading: GestureDetector(
                          onTap: () => _showSecondPage(context),
                          child: const Hero(
                            tag: 'profile-image-tag',
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                "https://lh3.googleusercontent.com/eH99aVaZyj3wswnAaW7ttaAMq1wHvY02mwEmXQOiP2DnrTa5k-hRMM2EpLkIw0QkyXASNV7DRra0glq310IEHpKkwB3qT7iIZHGShSOjNk3aDja5rF2ny-tt04CN-neNzpomCwxZE12HDtHMk4Sj23a_x4v9Qf9U5sBUtWLWdbqoQr7su5l3u7e3gEPXwADGHQ6m0g70vreIbz3YiXn_3draWPS_Y0wvTq3u_-roUHPj5JGaZyvERk0uP_W4vTsU7SrkRNAgGwl4sr5NMpGvv97I-sF2s0MD7tFbnXicq9xFLehb-g_EXlcGc9PxOAE7MUrmuDoSUYi6yMOyHzlZ4lCA0y1IzBL3w5N0lx7BNZ4PxRImIBf08j5y5tKwK-WvLBZQwjKR68DOOBX6hRgTcXvGHrnD9Lc5pK2oKfLV1Ko_1q6da9hngAazEFQ-gm-ww_JfVg7XzfUP091UZ9D5mm35rZS3xfrk3j7LxlYUEqIVhfJx7MzNcnRKQm5gZF-ya8MdVPv9bSNCrlqepLrDJp8OJAJ2P33IzHHBgTtD9Aot2Lr254nigbX22rBjyGwA1CtdzTLTKgqOgJd2HHSL2jyIPyvxIg1WTjrf1isJXAjM_GFWucv6rmj7rbxMT4uZs23g3U8xqlXv735ztlWnU7c0AQIrAmRwFLL_KinHEmOdL37bRMATRhN7UWKUZbZReN8UdI5ZrDTMy6Tf1j6SoFyOjw=w258-h251-no?authuser=0",
                              ),
                            ),
                          ),
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Nicollas Marinho",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Nicollas@gmail.com",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const AccountPage(),
                  buildNotifications(),
                  //buildTheme(context),
                  SwitchListTile(
                      title: const Text('Tema'),
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

  void _showSecondPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          body: Center(
            child: Hero(
              tag: 'profile-image-tag',
              child: Image.network(
                "https://lh3.googleusercontent.com/eH99aVaZyj3wswnAaW7ttaAMq1wHvY02mwEmXQOiP2DnrTa5k-hRMM2EpLkIw0QkyXASNV7DRra0glq310IEHpKkwB3qT7iIZHGShSOjNk3aDja5rF2ny-tt04CN-neNzpomCwxZE12HDtHMk4Sj23a_x4v9Qf9U5sBUtWLWdbqoQr7su5l3u7e3gEPXwADGHQ6m0g70vreIbz3YiXn_3draWPS_Y0wvTq3u_-roUHPj5JGaZyvERk0uP_W4vTsU7SrkRNAgGwl4sr5NMpGvv97I-sF2s0MD7tFbnXicq9xFLehb-g_EXlcGc9PxOAE7MUrmuDoSUYi6yMOyHzlZ4lCA0y1IzBL3w5N0lx7BNZ4PxRImIBf08j5y5tKwK-WvLBZQwjKR68DOOBX6hRgTcXvGHrnD9Lc5pK2oKfLV1Ko_1q6da9hngAazEFQ-gm-ww_JfVg7XzfUP091UZ9D5mm35rZS3xfrk3j7LxlYUEqIVhfJx7MzNcnRKQm5gZF-ya8MdVPv9bSNCrlqepLrDJp8OJAJ2P33IzHHBgTtD9Aot2Lr254nigbX22rBjyGwA1CtdzTLTKgqOgJd2HHSL2jyIPyvxIg1WTjrf1isJXAjM_GFWucv6rmj7rbxMT4uZs23g3U8xqlXv735ztlWnU7c0AQIrAmRwFLL_KinHEmOdL37bRMATRhN7UWKUZbZReN8UdI5ZrDTMy6Tf1j6SoFyOjw=w258-h251-no?authuser=0",
              ),
            ),
          ),
        ),
      ),
    );
  }
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