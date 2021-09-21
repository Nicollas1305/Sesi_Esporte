import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _sliderVal = 1.0;

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
                setState(() => _sliderVal = value);
              }),
        ),
      ],
    );
  }
}
