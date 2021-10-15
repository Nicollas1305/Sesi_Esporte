import 'package:flutter/material.dart';

class CardBeachTennis extends StatefulWidget {
  const CardBeachTennis({Key? key}) : super(key: key);

  @override
  _CardBeachTennisState createState() => _CardBeachTennisState();
}

class _CardBeachTennisState extends State<CardBeachTennis> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 6),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.sports_tennis),
              title: Text('Aula Beach Tennis'),
              subtitle: Text(
                '15/11/2021',
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  textColor: Colors.orange,
                  onPressed: () {
                    /*Navigator.of(context).pushNamed('/home');*/
                  },
                  child: const Text('Efetuar pagamento'),
                ),
                Text('Situação:'),
                Text(
                  'NÃO PAGO',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/**
Widget cardBeachTennis() {
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
            leading: const Icon(Icons.sports_tennis),
            title: const Text('Aula Beach Tennis'),
            subtitle: Text(
              '15/11/2021',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                textColor: Colors.orange,
                onPressed: () {
                  Navigator.pushNamed('/payments');
                },
                child: const Text('Efetuar pagamento'),
              ),
              Text('Situação:'),
              Text(
                'NÃO PAGO',
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
*/