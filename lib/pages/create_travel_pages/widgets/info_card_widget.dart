import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title1;
  final String title1Value;
  final String title2;
  final String title2Value;
  final Function onPressed;
  const InfoCard(
      {required this.title1,
      required this.title2,
      required this.onPressed,
      required this.title1Value,
      required this.title2Value,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$title1 : $title1Value'),
              Text('$title2 : $title2Value'),
            ],
          ),
          leading: IconButton(
            onPressed: () => onPressed(),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}