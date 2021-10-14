import 'package:flutter/material.dart';
import 'package:sesi_esporte/widgets/cards/card_beach_tennis.dart';
import 'package:sesi_esporte/widgets/cards/card_society_soccer_field.dart';

class Historic extends StatefulWidget {
  const Historic({Key? key}) : super(key: key);

  @override
  _HistoricState createState() => _HistoricState();
}

class _HistoricState extends State<Historic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //CardBeachTennis(),
            //cardSocietySoccer(),
            Image.asset('assets/images/card.png'),
          ],
        ),
      ),
    );
  }
}
