import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/charging/addslots.dart';
import 'package:newpro/screens/charging/slot_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class SlotsView extends StatefulWidget {
  const SlotsView({Key? key}) : super(key: key);

  @override
  State<SlotsView> createState() => _SlotsViewState();
}

class _SlotsViewState extends State<SlotsView> {
  late SharedPreferences localStrorage;
  String slot_no = "";
  String status = "";
  late String charging_station_id;

  List _loadslotlist = [];
  bool isLoading = false;
  late String _id;

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
        '/api/charging/view-slots/' + charging_station_id.replaceAll('"', ''));
    print(res);
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

  _confirm(String id) async {
    setState(() {
      var _isLoading = true;
    });

    var data = {"_id": id};
    print(data);
    var res = await Api().getData('/api/charging/update-slot/' + id);
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print("body of res${body}");

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SlotsView()));
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
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Column(
                          children: [
                            Text("₹-${_loadslotlist[position]['amount']}",
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                _id = _loadslotlist[position]['_id'];
                                _confirm(_id);

                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => SlotStatus()));
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
                                      "Status",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Addslots()));
          setState(() {});
        },
      ),
    );
  }
}
