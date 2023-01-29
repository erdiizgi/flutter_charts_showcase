import 'package:flutter/material.dart';

// convenience widget for holding the charts
class CardWithTitle extends StatelessWidget {
  final String title;
  final Widget content;

  const CardWithTitle(this.title, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: content,
              )
            ],
          ),
        ));
  }
}
