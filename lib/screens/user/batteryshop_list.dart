import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import 'batteryshop_userview.dart';

class BatteryShopList extends StatefulWidget {
  const BatteryShopList({Key? key}) : super(key: key);

  @override
  State<BatteryShopList> createState() => _BatteryShopListState();
}

class _BatteryShopListState extends State<BatteryShopList> {
  late SharedPreferences localStrorage;
  late String login_id;
  late String Shop_id;
  late String name;
  late String address;
  late String location;
  List _loadshoplist = [];
  bool isLoading = false;
  String battery_id = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    localStrorage = await SharedPreferences.getInstance();
    login_id = (localStrorage.getString('login_id') ?? '');
    print('login_ServiceList ${login_id}');
    var res = await Api()
        .getData('/api/user/view-battery-shop' + login_id.replaceAll("", ''));
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loadshoplist = items;
      });
    } else {
      setState(() {
        _loadshoplist = [];
      });
    }
  }

  // List Shops = [
  //   'KNCO',
  //   'Torrus',
  //   'Dounttown',
  //   'Hysung',
  // ];
  // List place = [
  //   'Nadkkav',
  //   'Railway',
  //   'Kallai',
  //   'Balussery',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF3FB95C),
              Color(0xFF3F83B9),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Battery Shops',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _loadshoplist.length,
          itemBuilder: (BuildContext context, int position) {
            return GestureDetector(
              onTap: () async {
                battery_id = _loadshoplist[position]['_id'];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AvailableBatteryList(battery_id)));
              },
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("images/battery-sp.png"),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                _loadshoplist[position]['name'],
                                style: TextStyle(fontSize: 22),
                              ),
                              Text(_loadshoplist[position]['address'],
                                  style: TextStyle(fontSize: 20)),
                              Text(_loadshoplist[position]['location'],
                                  style: TextStyle(fontSize: 20)),
                              // Text(Amount[position],
                              //     style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //                 AvailableBatteryList()));
                          //   },
                          //   child: Ink(
                          //     decoration: BoxDecoration(
                          //       gradient: LinearGradient(
                          //           colors: [
                          //             Color(0xFF3FAAB9),
                          //             Color(0xFF993FB9)
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
                          //           "View",
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
