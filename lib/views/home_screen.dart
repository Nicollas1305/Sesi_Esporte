import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _sliderVal = 0.0;

  @override
  Widget build(BuildContext contexts) {
    return Column(
      children: [
        Padding(padding: const EdgeInsetsDirectional.only(top: 75)),
        Text('A cada 10 locações ganhe 1 Gratuita.'),
        Container(
          padding: const EdgeInsetsDirectional.only(top: 10),
          alignment: Alignment.topCenter,
          child: Slider(
              thumbColor: Colors.orange,
              activeColor: Colors.orange,
              value: _sliderVal,
              max: 10,
              divisions: 10,
              label: '${_sliderVal.round()}',
              onChanged: (double value) {
                null;
              }),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
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
            Card(
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
          ],
        ),
      ],
    );
  }
}
