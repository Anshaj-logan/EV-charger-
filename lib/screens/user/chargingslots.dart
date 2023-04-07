import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import 'chargingstation.dart';

class ChargingSlots extends StatefulWidget {
  late String charging_station_id;
  late String Log_id;

  ChargingSlots(this.charging_station_id, this.Log_id);

  @override
  State<ChargingSlots> createState() => _ChargingSlotsState();
}

class _ChargingSlotsState extends State<ChargingSlots> {
  late SharedPreferences localStrorage;
  String slot_no = "";
  late String slot;
  String status = "";
  late String login_id;
  late String Charge_id;
  List _loadslotlist = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    String data = "${widget.charging_station_id}";
    String log_id = "${widget.Log_id}";
    print("idddd${data}");
    var res = await Api().getData('/api/charging/view-slots/' + data);

    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loadslotlist = items;
      });
    } else {
      setState(() {
        _loadslotlist = [];
      });
    }
  }

  // List Available_slots = [
  //   'Slot-1',
  //   'Slot-2',
  //   'Slot-3',
  //   'Slot-4',
  //   'Slot-5',
  //   'Slot-6',
  // ];
  // List Status = [
  //   'Availble',
  //   'Not Availble',
  //   'Availble',
  //   'Availble',
  //   'Not Availble',
  //   'Availble',
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
            'Slots',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _loadslotlist.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // CircleAvatar(
                        //   radius: 60,
                        //   backgroundImage: AssetImage("images/slot.png"),
                        // ),
                        // SizedBox(
                        //   width: 40,
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              _loadslotlist[position]['slot_no'],
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(_loadslotlist[position]['status'],
                                style: TextStyle(fontSize: 20)),
                            // Text(Amount[position],
                            //     style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Charge_id = _loadslotlist[position]
                                    ['charging_station_id'];
                                slot = _loadslotlist[position]['slot_no'];
                                // String log_id = "${widget.Log_id}";
                                // login_id = log_id;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Chargingstation(Charge_id, slot)));
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF3FAAB9),
                                        Color(0xFF993FB9)
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
                                      "Choose",
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
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
