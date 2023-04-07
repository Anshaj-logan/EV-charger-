import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/service/update_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api.dart';
import 'addservices.dart';

class Availableservices extends StatefulWidget {
  const Availableservices({super.key});

  @override
  State<Availableservices> createState() => _AvailableservicesState();
}

class _AvailableservicesState extends State<Availableservices> {
  late SharedPreferences localStrorage;
  String service_name = "";
  String amount = "";
  String duration = "";

  late String ServiceId;

  late String _id;

  List _loadservicelist = [];
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
    ServiceId = (localStrorage.getString('serviceStationId') ?? '');
    print('new charging ${ServiceId}');

    var res = await Api()
        .getData('/api/station/view-services/' + ServiceId.replaceAll('"', ''));
    print(res);

    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      // var _id = ['_id'];
      // print(_id);
      setState(() {
        _loadservicelist = items;
      });
    } else {
      setState(() {
        _loadservicelist = [];
      });
    }
  }

  _delete(String id) async {
    setState(() {
      var _isLoading = true;
    });

    var data = {"_id": id};
    print(data);
    var res = await Api().getData('/api/station/delete-services/' + id);
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print("body of res${body}");

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Availableservices()));
      print(body['message']);
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  // List Available_services = [
  //   'Water Services',
  //   'Break fluid change',
  //   'Filter Replacement',
  //   'Overall Chekking ',
  //   'Tire Change',
  //   'Engine Services',
  // ];
  // List Amount = [
  //   '500/-',
  //   '1200/-',
  //   '3500/-',
  //   '1500/-',
  //   '700/-',
  //   '1250/-',
  // ];
  // List Duration = [
  //   "30 m",
  //   "1 h",
  //   "4 h",
  //   "2 h",
  //   "1.5 h",
  //   "5 hr",
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
              Color(0xFFD9C231),
              Color(0xFFFF5733),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            'Service Station',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _loadservicelist.length,
          itemBuilder: (BuildContext context, int position) {
            return GestureDetector(
              onTap: () async {
                _id = _loadservicelist[position]['_id'];
                print("_id ${_id}");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UpdateServices(
                          _id,
                        )));
              },
              child: Card(
                child: Column(
                  children: [
                    Text(
                      _loadservicelist[position]['service_name'],
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      _loadservicelist[position]['amount'],
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      _loadservicelist[position]['duration'],
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold, fontSize: 15),
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
                          //             Color(0xFFD9C231),
                          //             Color(0xFF52D931),
                          //           ],
                          //           begin: Alignment.centerLeft,
                          //           end: Alignment.centerRight),
                          //       borderRadius: BorderRadius.circular(30),
                          //     ),
                          //     child: Container(
                          //         constraints: BoxConstraints(
                          //             maxWidth: 120, minHeight: 40),
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
                          //   width: 10,
                          // ),
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                _id = _loadservicelist[position]['_id'];
                                _delete(_id);
                              });
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFD9C231),
                                      Color(0xFFDC2F1D),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 120, minHeight: 40),
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
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Addservices()));
          setState(() {});
        },
      ),
    );
  }
}
