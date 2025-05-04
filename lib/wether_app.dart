//import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

//import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_wether_app/additional.dart';
import 'package:my_wether_app/child_card.dart';
import 'package:my_wether_app/frist_page.dart';
import 'package:my_wether_app/secrete.dart';

class weather_app extends StatelessWidget {
  //WetherApp(city:"Kundapura", contry:"IN");
  late String city;
  late String contry;
  weather_app({super.key, required this.city, required this.contry});

  Future wethre_API() async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city,$contry&APPID=$api1',
        ),
      );

      final response = jsonDecode(res.body);
      if (response['cod'] != '200') {
        throw "error 401";
      }
      return response;
      //  print("weter api");
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        //surfaceTintColor: Color.fromARGB(216, 0, 0, 0),
        title: Text(
          "wether app ",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(216, 7, 0, 0),
          ),
        ),
        elevation: 1,
        // backgroundColor: Color.fromARGB(160, 179, 179, 206),
        foregroundColor: Color.fromARGB(209, 200, 200, 216),
        centerTitle: true,
        actions: [
          //  IconButton(onPressed: () {}, icon: Icon(Icons.refresh_outlined)),
        ],
        backgroundColor: Color.fromARGB(148, 134, 218, 131),
      ),

      body: FutureBuilder(
        future: wethre_API(),
        builder: (context, snapshot) {
          // print(snapshot.runtimeType);
          // print(snapshot.connectionState);
          // print(snapshot.error);
          // print(snapshot.hashCode);
          // print(snapshot);
          //print("futer builder");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final response = snapshot.data!;
          final temp = response['list'][0]['main']['temp'];
          List? temps;

          IconData icon;

          temps = [
            response['list'][0]['main']['temp'],
            response['list'][1]['main']['temp'],
            response['list'][2]['main']['temp'],
            response['list'][3]['main']['temp'],
            response['list'][4]['main']['temp'],
            response['list'][5]['main']['temp'],
          ];

          final humidity = response['list'][0]['main']['humidity'];
          final wind = response['list'][0]['wind']['speed'];
          final visibality = response['list'][0]['visibility'];
          if (temp < 298) {
            icon = Icons.cloud;
          } else if (temp > 298 && temp < 308) {
            icon = Icons.sunny_snowing;
          } else if (temp > 308) {
            icon = Icons.sunny;
          } else {
            icon = Icons.cloud_off_outlined;
          }

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,

            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: double.infinity,
                    child: SizedBox(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Card(
                          elevation: 50,
                          child: Column(
                            children: [
                              Text(
                                temp.toString() + "K",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 10),

                              Icon(icon, size: 70),

                              SizedBox(height: 10),
                              Text(
                                city,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  Text(
                    "weather forecast",
                    style: TextStyle(
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 2,
                      children: [
                        child_cards(
                          value: temps[0].toString() + "k",
                          time: "present",
                          icon:
                              Icons
                                  .signal_cellular_connected_no_internet_0_bar_outlined,
                        ),
                        child_cards(
                          value: temps[1].toString() + "K",
                          time: "1 HOUR",
                          icon:
                              Icons
                                  .signal_cellular_connected_no_internet_0_bar_outlined,
                        ),
                        child_cards(
                          value: temps[2].toString() + "k",
                          time: "2 HOURS",
                          icon:
                              Icons
                                  .signal_cellular_connected_no_internet_0_bar_outlined,
                        ),
                        child_cards(
                          value: temps[3].toString() + "K",
                          time: "3 HOURS",
                          icon:
                              Icons
                                  .signal_cellular_connected_no_internet_0_bar_outlined,
                        ),
                        child_cards(
                          value: temps[4].toString() + "K",
                          time: "4 HOURS",
                          icon:
                              Icons
                                  .signal_cellular_connected_no_internet_0_bar_outlined,
                        ),
                        child_cards(
                          value: temps[5].toString() + "k",
                          time: "5 HOURS",
                          icon:
                              Icons
                                  .signal_cellular_connected_no_internet_0_bar_outlined,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "additonal information",
                      style: TextStyle(
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      additional_information(
                        icon: Icons.water_drop_outlined,
                        lebel: "humidity",
                        value: humidity.toString(),
                      ),
                      additional_information(
                        icon: Icons.wind_power_outlined,
                        lebel: "wind speed",
                        value: wind.toString(),
                      ),
                      additional_information(
                        icon: Icons.remove_red_eye,
                        lebel: "visibality",
                        value: visibality.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    throw UnimplementedError();
  }
}
