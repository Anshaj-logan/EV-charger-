import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/user/servicestation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class AvailableServiceList extends StatefulWidget {
  late String id;

  AvailableServiceList(this.id);

  @override
  State<AvailableServiceList> createState() => _AvailableServiceListState();
}

class _AvailableServiceListState extends State<AvailableServiceList> {
  late SharedPreferences localStrorage;
  late String service_station_id;
  late String S_id;
  late String service_name;
  late String duration;
  late String amount;

  List _loadservicelist = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    String data = "${widget.id}";
    print("idddd${data}");
    var res = await Api().getData('/api/station/view-services/' + data);

    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loadservicelist = items;
      });
    } else {
      setState(() {
        _loadservicelist = [];
      });
    }
  }
  // List Available_Services = [
  //   'WATER SERVICE',
  //   'BRAKE FLUID CHANGE',
  //   'FILTER REPLACEMENT',
  //   'OVERALL CHECKING',
  //   'TIRE CHANGE'
  // ];
  // List Status = [
  //   'Availble',
  //   'Not Availble',
  //   'Availble',
  //   'Availble',
  //   'Not Availble',
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
            'Services',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _loadservicelist.length,
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
                              _loadservicelist[position]['service_name'],
                              style: TextStyle(fontSize: 22),
                            ),
                            Text("\₹-${_loadservicelist[position]['amount']}",
                                style: TextStyle(fontSize: 20)),
                            Text(_loadservicelist[position]['duration'],
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
                                S_id = _loadservicelist[position]['_id'];
                                service_station_id = _loadservicelist[position]
                                    ['service_station_id'];
                                service_name =
                                    _loadservicelist[position]['service_name'];
                                amount = _loadservicelist[position]['amount'];
                                duration =
                                    _loadservicelist[position]['duration'];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Servicestation(
                                            S_id,
                                            service_station_id,
                                            service_name,
                                            amount,
                                            duration)));
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
