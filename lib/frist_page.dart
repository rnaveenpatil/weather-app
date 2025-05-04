import 'package:flutter/material.dart';
import 'package:my_wether_app/wether_app.dart';

class FristPage extends StatefulWidget {
  FristPage({super.key});

  @override
  State<FristPage> createState() => FristPageState();
}

class FristPageState extends State<FristPage> {
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        elevation: 30,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              transformAlignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Enter your location",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(253, 194, 156, 31),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    "Enter city!",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 186, 87, 41),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      hintText: "Enter city",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "city",
                      prefixIcon: Icon(Icons.location_on),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Enter contry!",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 186, 87, 41),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: countryController,
                    decoration: InputDecoration(
                      hintText: "Enter contry",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Contry",
                      prefixIcon: Icon(Icons.location_on),
                    ),
                  ),

                  SizedBox(height: 50),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => weather_app(
                                city: cityController.text,
                                contry: countryController.text,
                              ),
                        ),
                      );
                    },

                    child: Text(
                      "Get Weather",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 186, 87, 41),
                      ),
                    ),

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
