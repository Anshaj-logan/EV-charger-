import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/user/service_slots.dart';
import 'package:newpro/screens/user/servicestation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class ServiceStaionList extends StatefulWidget {
  const ServiceStaionList({Key? key}) : super(key: key);

  @override
  State<ServiceStaionList> createState() => _ServiceStaionListState();
}

class _ServiceStaionListState extends State<ServiceStaionList> {
  late SharedPreferences localStrorage;
  late String login_id;
  late String Service_id;
  late String name;
  late String address;
  late String location;
  List _loadServicelist = [];
  bool isLoading = false;
  late String id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    // localStrorage = await SharedPreferences.getInstance();
    // login_id = (localStrorage.getString('login_id') ?? '');
    // print('login_ServiceList ${login_id}');
    var res = await Api().getData('/api/user/view-service-station');
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loadServicelist = items;
      });
    } else {
      setState(() {
        _loadServicelist = [];
      });
    }
  }

  // List Available_slots = [
  //   'Citron',
  //   'Aether',
  //   'Tata',
  //   'MG',
  //   'OLA',
  //   'TVS',
  // ];
  // List place = [
  //   'Calicut',
  //   'Calicut',
  //   'Calicut',
  //   'Calicut',
  //   'Calicut',
  //   'Calicut',
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
            'Service Stations',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _loadServicelist.length,
          itemBuilder: (BuildContext context, int position) {
            return GestureDetector(
              onTap: () async {
                id = _loadServicelist[position]['_id'];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AvailableServiceList(id)));
              },
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage("images/service-center.png"),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                _loadServicelist[position]['name'],
                                style: TextStyle(fontSize: 25),
                              ),
                              Text(_loadServicelist[position]['address'],
                                  style: TextStyle(fontSize: 20)),
                              Text(_loadServicelist[position]['location'],
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
                          //                 AvailableServiceList()));
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
                          //           "Book",
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
