import 'package:flutter/material.dart';

Widget notificatioCard() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Card(
          color: Colors.white38,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
          ),
          child: SizedBox(
            height: 100.0,
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: Text('   Área destinada a notificações'),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
