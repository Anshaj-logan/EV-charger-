import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class Bookedslots extends StatefulWidget {
  const Bookedslots({super.key});

  @override
  State<Bookedslots> createState() => _BookedslotsState();
}

class _BookedslotsState extends State<Bookedslots> {
  late SharedPreferences localStrorage;
  String slot_no = "";
  String status = "";
  late String charging_station_id;

  List _loadbookslotlist = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    localStrorage = await SharedPreferences.getInstance();
    charging_station_id = (localStrorage.getString('chargingStationIid') ?? '');
    print('new charging ${charging_station_id})');

    var res = await Api().getData(
        '/api/charging/view-booked-slots-charging-station/' +
            charging_station_id.replaceAll('"', ''));
    print(res);
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loadbookslotlist = items;
      });
    } else {
      setState(() {
        _loadbookslotlist = [];
      });
    }
  }

  // List Booked_slots = [
  //   'slot 2',
  //   'slot 3',
  //   'slot 6',
  //   'slot 9',
  // ];
  // List Amount = [
  //   '500/-',
  //   '400/-',
  //   '600/-',
  //   '300/-',
  // ];
  // List Duration = [
  //   '5 h',
  //   '4 h',
  //   '6 h',
  //   '3 h',
  // ];
  // List Date = [
  //   '2.3.2023',
  //   '3.5.2023',
  //   '4.3.2023',
  //   '5.3.2023',
  // ];
  // List Time = [
  //   '5:00 PM',
  //   '4:30 PM',
  //   '6:00 PM',
  //   '11:30 AM',
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
              Color(0xFF31B5D9),
              Color(0xFF31B0D9),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Booked Slots',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: _loadbookslotlist.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/slot.png"),
                  ),
                  Column(
                    children: [
                      Text(_loadbookslotlist[position]['slot_no'],
                          style: TextStyle(fontSize: 25)),
                      Text(_loadbookslotlist[position]['amount'],
                          style: TextStyle(fontSize: 22)),
                      Text(
                        _loadbookslotlist[position]['date'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(_loadbookslotlist[position]['time'],
                          style: TextStyle(fontSize: 20)),
                      // Text(Time[position], style: TextStyle(fontSize: 20)),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF31B5D9),
                                        Color(0xFF36D931)
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
                                      "Confirm",
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
                            SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF36D931),
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
                                      "Reject",
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
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
