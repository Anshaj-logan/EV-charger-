import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import 'availablebattery.dart';

class Addbattery extends StatefulWidget {
  const Addbattery({super.key});

  @override
  State<Addbattery> createState() => _AddbatteryState();
}

class _AddbatteryState extends State<Addbattery> {
  bool _isLoading = false;
  String batteryShopId = "";
  late SharedPreferences localStorage;
  _pressCreateAccountButton() {
    AddBattery();
  }

  //TextEditingController idController = TextEditingController();
  TextEditingController vehicle_name = TextEditingController();
  TextEditingController model_name = TextEditingController();
  TextEditingController capacity = TextEditingController();
  TextEditingController amount = TextEditingController();
  @override
  void dispose() {
    // idController.dispose();
    vehicle_name.dispose();
    model_name.dispose();
    capacity.dispose();
    amount.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  void AddBattery() async {
    localStorage = await SharedPreferences.getInstance();
    batteryShopId = (localStorage.getString('batteryShopId') ?? '');
    print('battery_shop_id ${batteryShopId}');
    setState(() {
      _isLoading = true;
    });

    var data = {
      "battery_shop_id": batteryShopId.replaceAll('"', ''),
      "vehicle_name": vehicle_name.text,
      "model_name": model_name.text,
      "capacity": capacity.text,
      "amount": amount.text,
    };
    print(data);
    var res = await Api().authData(data, '/api/battery/add-battery');
    var body = json.decode(res.body);

    print(body);
    if (body['success'] == true) {
      print(res);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Availablebattery()));
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
              Color(0xFF3FAAB9),
              Color(0xFF993FB9),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            'Add New Battery',
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
                  TextField(
                    controller: vehicle_name,
                    decoration: InputDecoration(
                      hintText: "Vehicle Name",
                      icon: Icon(
                        Icons.moped,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: model_name,
                    decoration: InputDecoration(
                      hintText: "Model Name",
                      icon: Icon(
                        Icons.table_rows_outlined,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: capacity,
                    decoration: InputDecoration(
                      hintText: "Capacity",
                      icon: Icon(
                        Icons.charging_station,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: amount,
                    decoration: InputDecoration(
                      hintText: "Amount",
                      icon: Icon(
                        Icons.money,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(),
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
                            colors: [Color(0xFF993FB9), Color(0xFF36D931)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 100, minHeight: 30),
                          alignment: Alignment.center,
                          child: Text(
                            "Add",
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
