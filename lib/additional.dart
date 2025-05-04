import 'package:flutter/material.dart';

class additional_information extends StatelessWidget {
  final IconData icon;
  final String lebel;
  final String value;

  const additional_information({
    super.key,
    required this.icon,
    required this.lebel,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(icon, size: 50),
              Text(
                lebel,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
              ),

              Text(
                value,
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    throw UnimplementedError();
  }
}
