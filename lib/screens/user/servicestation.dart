import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/Payment/service_payment_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class Servicestation extends StatefulWidget {
  late String S_id;
  late String service_station_id;
  late String service_name;
  late String amount;
  late String duration;

  Servicestation(this.S_id, this.service_station_id, this.service_name,
      this.amount, this.duration);

  @override
  State<Servicestation> createState() => _ServicestationState();
}

class _ServicestationState extends State<Servicestation> {
  // String dropdownValue = 'WATER SERVICE';
  DateTime selectedDate = DateTime.now();
  late String startDate;
  late String amounts;
  late String servicename;
  bool _isLoading = false;

  late SharedPreferences localStorage;

  final _formKey = GlobalKey<FormState>();
  void Bookservice() async {
    localStorage = await SharedPreferences.getInstance();
    String Login_id = (localStorage.getString('loginId') ?? '');
    print('login id ${Login_id}');
    String service_station_id = "${widget.service_station_id}";
    print('service_station_id ${service_station_id}');
    String S_id = "${widget.S_id}";
    print('S_id ${S_id}');
    String service_name = "${widget.service_name}";
    print('service_name ${service_name}');
    String duration = "${widget.duration}";
    print('model_name ${duration}');
    String amount = "${widget.amount}";
    print('amount ${amount}');

    amounts = amount;
    servicename = service_name;
    setState(() {
      _isLoading = true;
    });

    var data = {
      "date": startDate,
      "service_id": S_id,
      "login_id": Login_id.replaceAll('"', ''),
      "service_station_id": service_station_id,
      "service_name": service_name,
      "duration": duration,
      "amount": amount,
    };
    print(data);
    var res = await Api().authData(data, '/api/station/service-booking');
    var body = json.decode(res.body);

    print(body);
    if (body['success'] == true) {
      print(res);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Service_Payment_Screen(amounts, servicename)));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

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
            'Service Booking',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          //decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://www.ssr-inc.com/wp-content/uploads/EV-charging-1082x546.jpg"),fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        child: const Text('Booking Date'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          height: 45,
                          width: 110,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black38),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintText: "Time",
                //       icon: Icon(
                //         Icons.timelapse,
                //         color: Colors.blueGrey,
                //       ),
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintText: "Duration",
                //       icon: Icon(
                //         Icons.timer_10_select_sharp,
                //         color: Colors.blueGrey,
                //       ),
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintText: "Amount",
                //       icon: Icon(
                //         Icons.payment,
                //         color: Colors.blueGrey,
                //       ),
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: Ink(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //           colors: [Color(0xFF3FAAB9), Color(0xFF993FB9)],
                    //           begin: Alignment.centerLeft,
                    //           end: Alignment.centerRight),
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     child: Container(
                    //         constraints:
                    //             BoxConstraints(maxWidth: 150, minHeight: 50),
                    //         alignment: Alignment.center,
                    //         child: Text(
                    //           "Book",
                    //           style: GoogleFonts.montserrat(
                    //               fontWeight: FontWeight.bold, fontSize: 20),
                    //         )),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(30),
                    //       ),
                    //       padding: EdgeInsets.all(0.0)),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        Bookservice();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             Service_Payment_Screen()));
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
                                BoxConstraints(maxWidth: 100, minHeight: 50),
                            alignment: Alignment.center,
                            child: Text(
                              "Pay",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
