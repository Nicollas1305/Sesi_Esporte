import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:sesi_esporte/views/create_payments.dart';
import 'package:sesi_esporte/views/new_payments.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaisedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Payment(context);
                    });
              },
              child: const Text("Novo Meio de Pagamernto"),
              color: Colors.orange[600],
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

Widget Payment(context) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Payments(),
            SimpleSettingsTile(
              title: 'Cartão de Débito',
              subtitle: '',
              leading: Icon(
                FontAwesomeIcons.creditCard,
                color: Colors.orange,
              ),
              onTap: () {},
            ),
            SimpleSettingsTile(
              title: 'Pix',
              subtitle: '',
              leading: Tab(
                icon: Container(
                  child: const Image(
                    image: AssetImage(
                      'assets/images/pix.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  height: 17,
                  width: 50,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    ),
  ]);
}
