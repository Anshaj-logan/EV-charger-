import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/user/ucomplaintv.dart';
import 'package:newpro/screens/user/userhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class UChargeCmp extends StatefulWidget {
  const UChargeCmp({Key? key}) : super(key: key);

  @override
  State<UChargeCmp> createState() => _UChargeCmpState();
}

class _UChargeCmpState extends State<UChargeCmp> {
  station? _station;
  bool _isLoading = false;
  late String login_id;
  late SharedPreferences localStorage;
  List _loadCharginglist = [];
  List _loadServicelist = [];
  late String charge;
  late String service;
  TextEditingController complaint = TextEditingController();

  @override
  void dispose() {
    // idController.dispose();
    complaint.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchChargingData();

    getAllId();
  }

  _fetchChargingData() async {
    var res = await Api().getData('/api/user/view-charging-station/');

    if (res.statusCode == 200) {
      var charging = json.decode(res.body)['data'];
      print('charging data${charging}');
      String charging_id = charging[0]['_id'];
      print(charging_id);
      setState(() {
        _loadCharginglist = charging;
      });
    } else {
      setState(() {
        _loadCharginglist = [];
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  void Addcomplaint() async {
    localStorage = await SharedPreferences.getInstance();
    String Login_id = (localStorage.getString('loginId') ?? '');
    print('User login ${Login_id}');
    setState(() {
      _isLoading = true;
    });

    var data = {
      "login_id": Login_id.replaceAll('"', ''),
      "date": startDate,
      "complaint": complaint.text,
      "charging_station_id": selectId,
    };
    print(data);
    var res =
        await Api().authData(data, '/api/user/add-complaint-charging-station');
    var body = json.decode(res.body);

    print(body);
    if (body['success'] == true) {
      print(res);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserHome()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  DateTime selectedDate = DateTime.now();
  late String startDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        startDate =
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
      });
    }
  }

  List vol_id = [];
  String? selectId;
  Future getAllId() async {
    var res = await Api().getData('/api/user/view-charging-station/');
    var body = json.decode(res.body);

    print(res);
    setState(() {
      print(body);
      vol_id = body['data'];
      // depart_id = body['data'][0]['_id'];
    });
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
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            'Compliants',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        //decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://www.ssr-inc.com/wp-content/uploads/EV-charging-1082x546.jpg"),fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          hint: Text('Charging_station'),
                          style: TextStyle(color: Colors.black),
                          value: selectId,
                          items: vol_id
                              .map((type) => DropdownMenuItem<String>(
                                    value: type['_id'].toString(),
                                    child: Text(
                                      type['name'].toString(),
                                      style: TextStyle(color: Colors.black26),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (type) {
                            setState(() {
                              selectId = type;
                            });
                          }),
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: ListTile(
                  //         title: const Text('Charging Station'),
                  //         leading: Radio<station>(
                  //           value: station.charging_station,
                  //           groupValue: _station,
                  //           onChanged: (station? value) {
                  //             setState(() {
                  //               _station = value;
                  //               _fetchChargingData();
                  //             });
                  //           },
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: ListTile(
                  //         title: const Text('Service Station'),
                  //         leading: Radio<station>(
                  //           value: station.service_station,
                  //           groupValue: _station,
                  //           onChanged: (station? value) {
                  //             setState(() {
                  //               _station = value;
                  //
                  //               -_fetchServiceData();
                  //             });
                  //           },
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: const Text('Select date'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      height: 45,
                      width: 150,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                          style: TextStyle(fontSize: 16, color: Colors.black38),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: complaint,
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 7,
                    decoration: InputDecoration(
                      hintText: "Complaint",
                      labelText: "Add your complaint",
                      icon: Icon(
                        Icons.message,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Addcomplaint();
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFF3FAAB9), Color(0xFF993FB9)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                            constraints:
                                BoxConstraints(maxWidth: 150, minHeight: 50),
                            alignment: Alignment.center,
                            child: Text(
                              "Submit",
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
