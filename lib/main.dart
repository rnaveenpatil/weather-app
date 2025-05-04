import 'package:flutter/material.dart';
import 'package:my_wether_app/frist_page.dart';

void main() {
  runApp(wether());
}

class wether extends StatelessWidget {
  const wether({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: "waether app",
      home: FristPage(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
    throw UnimplementedError();
  }
}
