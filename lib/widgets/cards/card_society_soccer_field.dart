import 'package:flutter/material.dart';

Widget cardSocietySoccer() {
  return Padding(
    padding: const EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 6),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.sports_soccer),
            title: const Text('Aluguel Campo Society'),
            subtitle: Text(
              '19/11/2021',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          /**Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),*/
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                textColor: Colors.orange,
                onPressed: () {
                  // Perform some action
                },
                child: const Text('Visualizar Comprovante'),
              ),
              Text('Situação:'),
              Text(
                'PAGO',
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
