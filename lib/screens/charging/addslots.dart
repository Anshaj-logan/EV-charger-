import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/charging/chargingstationhome.dart';
import 'package:newpro/screens/charging/slot_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class Addslots extends StatefulWidget {
  const Addslots({super.key});

  @override
  State<Addslots> createState() => _AddslotsState();
}

class _AddslotsState extends State<Addslots> {
  bool _isLoading = false;
  String chargingStationIid = "";
  late SharedPreferences localStorage;
  _pressCreateAccountButton() {
    AddChargeslot();
  }

  //TextEditingController idController = TextEditingController();
  TextEditingController slotController = TextEditingController();
  TextEditingController amount = TextEditingController();
  @override
  void dispose() {
    // idController.dispose();
    slotController.dispose();
    amount.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  void AddChargeslot() async {
    localStorage = await SharedPreferences.getInstance();
    chargingStationIid = (localStorage.getString('chargingStationIid') ?? '');
    print('chargingStationIid ${chargingStationIid}');
    setState(() {
      _isLoading = true;
    });

    var data = {
      "charging_station_id": chargingStationIid.replaceAll('"', ''),
      "slot_no": slotController.text,
      "amount": amount.text,
    };
    print(data);
    var res = await Api().authData(data, '/api/charging/add-slot');
    var body = json.decode(res.body);

    print(body);
    if (body['success'] == true) {
      print(res);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SlotsView()));
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
              Color(0xFF31B5D9),
              Color(0xFF31B0D9),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Add New Slots',
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
                      controller: slotController,
                      decoration: InputDecoration(
                        hintText: "New Slot",
                        icon: Icon(
                          Icons.text_fields_sharp,
                          color: Colors.blueGrey,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       hintText: "Status",
                  //       icon: Icon(
                  //         Icons.flash_on_rounded,
                  //         color: Colors.blueGrey,
                  //       ),
                  //       border: OutlineInputBorder(),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _pressCreateAccountButton();
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF31B5D9), Color(0xFF36D931)],
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
