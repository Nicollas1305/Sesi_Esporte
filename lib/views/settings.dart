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
                                "https://lh3.googleusercontent.com/DcLTPCvpaHOXmTDISS8ZW1aNYHia-9kTyfQPFNgFnj0xpt8ohwuqHFM6XMRqCjc7f5b6-1oXsi7mitqFmyh2WlEkDSx0l1U7ZT_vvvXxMv9Yj_al4eQuSuCAqryPv8NJd7ebEZ1HVKJe9qA2fMuYcmVeDijp5pp4LlF8wu6LuWThuKc3ucp7JY1W6CBHz0NaZpKrYMD-qq3R5wTrG1RJNP2rmbGmAvjiyGFJmavo15SRMv7gkLaa9tuT9wZHHdoOBZFEwcCJSyynJhMAzX9HrT_sY_KkE1r9UGKDp32JX0DaLO0OtEgjXVZFDebHqOKrGEtoGQTnJsDR4IiELOIfl8OyciN7E5vsuH4HX58Q2Zgfxz6pbNOpzNLF8C33_h4CkjFonhMGj77BrdDISyek2fUPsVexNdys9emjfwiuUZlpHYwrfpXkbQAgJuQR5-tcuAcRyHn_GMAMltHe3nR3_7B8nMO-e1v52TkBHg7rVhq_JBF064R9YqyPUw5iYsNBhfq2L2JYVLNii7kk_93kFQiDBF1n7r7_kwbqubpYCLZ7s6G90BxXNCyDUbMn0UXgaDxDqvSlV8pMuXzEynLSN-2_GKseFOQkdAm1O0YO3ibKtiuUKH08Pgr0ZhTj0ZoFD3zBBBEI1HmkbLOi7y7ZXfrjteSomz-Qdf69pMBaiq7Rr117g7HFZRbzQMEzwlGBUNmX-dtD8iBqCxjZYhWvCHeF=w258-h251-no?authuser=0",
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
                "https://lh3.googleusercontent.com/DcLTPCvpaHOXmTDISS8ZW1aNYHia-9kTyfQPFNgFnj0xpt8ohwuqHFM6XMRqCjc7f5b6-1oXsi7mitqFmyh2WlEkDSx0l1U7ZT_vvvXxMv9Yj_al4eQuSuCAqryPv8NJd7ebEZ1HVKJe9qA2fMuYcmVeDijp5pp4LlF8wu6LuWThuKc3ucp7JY1W6CBHz0NaZpKrYMD-qq3R5wTrG1RJNP2rmbGmAvjiyGFJmavo15SRMv7gkLaa9tuT9wZHHdoOBZFEwcCJSyynJhMAzX9HrT_sY_KkE1r9UGKDp32JX0DaLO0OtEgjXVZFDebHqOKrGEtoGQTnJsDR4IiELOIfl8OyciN7E5vsuH4HX58Q2Zgfxz6pbNOpzNLF8C33_h4CkjFonhMGj77BrdDISyek2fUPsVexNdys9emjfwiuUZlpHYwrfpXkbQAgJuQR5-tcuAcRyHn_GMAMltHe3nR3_7B8nMO-e1v52TkBHg7rVhq_JBF064R9YqyPUw5iYsNBhfq2L2JYVLNii7kk_93kFQiDBF1n7r7_kwbqubpYCLZ7s6G90BxXNCyDUbMn0UXgaDxDqvSlV8pMuXzEynLSN-2_GKseFOQkdAm1O0YO3ibKtiuUKH08Pgr0ZhTj0ZoFD3zBBBEI1HmkbLOi7y7ZXfrjteSomz-Qdf69pMBaiq7Rr117g7HFZRbzQMEzwlGBUNmX-dtD8iBqCxjZYhWvCHeF=w258-h251-no?authuser=0",
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
    onTap: () {
      Navigator.pushReplacementNamed(context, "/login");
    },
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