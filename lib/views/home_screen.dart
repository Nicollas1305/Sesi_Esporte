import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sesi_esporte/widgets/notification_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _sliderVal = 1.0;

  @override
  Widget build(BuildContext contexts) {
    return Scaffold(
        body: Stack(children: <Widget>[
      SizedBox.expand(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text('A cada 10 locações ganhe 1 Gratuita.'),
                Container(
                  padding:
                      const EdgeInsetsDirectional.only(top: 10, bottom: 30),
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
                const Divider(),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
      draggableScrollableSheet()
    ]));
  }
}

Widget draggableScrollableSheet() {
  return DraggableScrollableSheet(
    initialChildSize: 0.2,
    minChildSize: 0.2,
    maxChildSize: 0.7,
    builder: (BuildContext context, ScrollController scrollController) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Scrollbar(
          child: ListView.builder(
            controller: scrollController,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return notificatioCard();
            },
          ),
        ),
      );
    },
  );
}
