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
                            "https://lh3.googleusercontent.com/0PHBOQVFW_J5SULcEva_AcxsRzn06HAmO3v3zoSm5YaBtn6e08k5HS3Xtfi_Hytq0s_I5AOmi7ZYjdX_CEUhw3zTMFrYDwSEA9N1TS1tCVo3Vsy36vCbcdPVX616kINlTPBJS9FBX38qIBPkT6P4_AR70uTyXMBOj85s0jTM4WD-HVuHMnPLlk3NTj-HBVyzXZpF1zKufqk5Su8wi4tGM8Ym5vGWyrFsU5kiKHLdTD-fm7AgNzmM6fcWwvdrfRWeNkf08vA3pnucWyVFjDTZ03VsrWoiD5bjl7DrW0hkIBS0qW5hOO_-blGtkEBOGDKq_F3byeBHai2V0EJlH48ENvgUNmnA-rTY2vv65lCY4xMt0wUviZOcwx3_YKr4C1TgmXiRnlsAbhJm0yOI0SAd50Hh2AK67qRsZ4qpa92ek2fHop_QMAwkfQAsKqpqErH-6QfkgReNANvqnnUzpoLLYnzzP17TWgMKn8wPWbk5_8spBwPtLiO189716M5Ph39NWO2FtqlhGl1taypHL2FU61Jl-wSVhRdMjelNmdDLOWel75tS711T0oFo00mO6olwN7HgOWb8cmHwREVOUDrX1r1GxjaxD6PuPkIPadQsuRWTOYcKpRC1ptf1An4SpGCyTpDxy1oluflR7cL54dhcNqFgsYR6Yh-Mr0ekgJhz1tOF7XYI-7Lr4hPcIUqsBaPOJTwpAzDciIFshWQ7Yox3CirKAA=w258-h251-no?authuser=0"),
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