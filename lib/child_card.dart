import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class child_cards extends StatelessWidget {
  final String time;
  final String value;
  final IconData icon;
  const child_cards({
    super.key,
    required this.icon,
    required this.time,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      width: 110,
      height: 110,
      child: Card(
        elevation: 50,
        child: Column(
          children: [
            Text(time, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Icon(icon, size: 20),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
