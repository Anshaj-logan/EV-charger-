import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import 'availableservices.dart';

class Addservices extends StatefulWidget {
  const Addservices({super.key});

  @override
  State<Addservices> createState() => _AddservicesState();
}

class _AddservicesState extends State<Addservices> {
  bool _isLoading = false;
  String serviceStationId = "";
  late SharedPreferences localStorage;
  _pressCreateAccountButton() {
    AddService();
  }

  //TextEditingController idController = TextEditingController();
  TextEditingController service_name = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController amount = TextEditingController();
  @override
  void dispose() {
    // idController.dispose();
    service_name.dispose();
    duration.dispose();
    amount.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  void AddService() async {
    localStorage = await SharedPreferences.getInstance();
    serviceStationId = (localStorage.getString('serviceStationId') ?? '');
    print('battery_shop_id ${serviceStationId}');
    setState(() {
      _isLoading = true;
    });

    var data = {
      "service_station_id": serviceStationId.replaceAll('"', ''),
      "service_name": service_name.text,
      "duration": duration.text,
      "amount": amount.text,
    };
    print(data);
    var res = await Api().authData(data, '/api/station/add-service');
    var body = json.decode(res.body);

    print(body);
    if (body['success'] == true) {
      print(res);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Availableservices()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFD9C231),
              Color(0xFFFF5733),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            'Add New Services',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: service_name,
                      decoration: InputDecoration(
                        hintText: "Service name",
                        icon: Icon(
                          Icons.text_fields_sharp,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: amount,
                      decoration: InputDecoration(
                        hintText: "Amount",
                        icon: Icon(
                          Icons.money,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: duration,
                      decoration: InputDecoration(
                        hintText: "Duration",
                        icon: Icon(
                          Icons.timeline,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _pressCreateAccountButton();
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFFD9C231),
                              Color(0xFF18A6E4),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 120, minHeight: 40),
                          alignment: Alignment.center,
                          child: Text(
                            "ADD",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.all(0.0)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
