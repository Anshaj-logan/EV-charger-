import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/battery/batteryshophome.dart';
import 'package:newpro/screens/battery/upadte_battery.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import 'addbattery.dart';

class Availablebattery extends StatefulWidget {
  const Availablebattery({super.key});

  @override
  State<Availablebattery> createState() => _AvailablebatteryState();
}

class _AvailablebatteryState extends State<Availablebattery> {
  late SharedPreferences localStrorage;
  String vehicle_name = "";
  String model_name = "";
  String capacity = "";
  String amount = "";
  late String batteryShopId;
  late String B_id;
  late String _id;

  List _loadbatterylist = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
    // _fetchDel();
  }

  _fetchData() async {
    localStrorage = await SharedPreferences.getInstance();
    batteryShopId = (localStrorage.getString('batteryShopId') ?? '');
    print('new charging ${batteryShopId}');

    var res = await Api().getData(
        '/api/battery/view-battery/' + batteryShopId.replaceAll('"', ''));
    print(res);

    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      // var _id = ['_id'];
      // print(_id);
      setState(() {
        _loadbatterylist = items;
      });
    } else {
      setState(() {
        _loadbatterylist = [];
      });
    }
  }

  _delete(String id) async {
    setState(() {
      var _isLoading = true;
    });

    var data = {"_id": id};
    print(data);
    var res = await Api().getData('/api/battery/delete-battery/' + id);
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print("body of res${body}");

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Availablebattery()));
      print(body['message']);
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                'Battery Shop',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            leading: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Batteryhome()));
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ))),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: _loadbatterylist.length,
            itemBuilder: (BuildContext context, int position) {
              return GestureDetector(
                onTap: () async {
                  B_id = _loadbatterylist[position]['_id'];
                  print("B_id ${B_id}");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UpdateBattery(
                            B_id,
                          )));
                },
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage("images/batteryev.png"),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                Text(
                                  _loadbatterylist[position]['vehicle_name'],
                                  style: TextStyle(fontSize: 29),
                                ),
                                Text(
                                  _loadbatterylist[position]['model_name'],
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  _loadbatterylist[position]['capacity'],
                                  style: TextStyle(fontSize: 22),
                                ),
                                Text(
                                  "\₹-${_loadbatterylist[position]['amount']}",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   child: Ink(
                            //     decoration: BoxDecoration(
                            //       gradient: LinearGradient(
                            //           colors: [
                            //             Color(0xFF993FB9),
                            //             Color(0xFF36D931)
                            //           ],
                            //           begin: Alignment.centerLeft,
                            //           end: Alignment.centerRight),
                            //       borderRadius: BorderRadius.circular(30),
                            //     ),
                            //     child: Container(
                            //         constraints: BoxConstraints(
                            //             maxWidth: 100, minHeight: 30),
                            //         alignment: Alignment.center,
                            //         child: Text(
                            //           "Update",
                            //           style: GoogleFonts.montserrat(
                            //               fontWeight: FontWeight.bold,
                            //               fontSize: 20),
                            //         )),
                            //   ),
                            //   style: ElevatedButton.styleFrom(
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(30),
                            //       ),
                            //       padding: EdgeInsets.all(0.0)),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            //   width: 10,
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: ElevatedButton(
                                onPressed: () async {
                                  _id = _loadbatterylist[position]['_id'];
                                  _delete(_id);
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF993FB9),
                                          Color(0xFFF71512)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 100, minHeight: 30),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Delete",
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: EdgeInsets.all(0.0)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Addbattery()));
            setState(() {});
          },
        ),
      ),
    );
  }
}
