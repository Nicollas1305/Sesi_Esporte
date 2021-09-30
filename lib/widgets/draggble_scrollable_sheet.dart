import 'package:flutter/material.dart';

import 'notification_card.dart';

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
