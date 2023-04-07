import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Payment/payment_Screen.dart';
import '../api.dart';

class Chargingstation extends StatefulWidget {
  late String charging_station_id;
  late String slot;

  Chargingstation(this.charging_station_id, this.slot);

  @override
  State<Chargingstation> createState() => _ChargingstationState();
}

class _ChargingstationState extends State<Chargingstation> {
  String time = '10:AM - 11:AM';
  // late String charging_station_id;
  // String dropdownValue = 'Slot 1';
  DateTime selectedDate = DateTime.now();
  late String startDate;
  bool _isLoading = false;

  late String amounts;
  late SharedPreferences localStorage;
  _pressCreateAccountButton() {
    Bookslot();
  }

  //TextEditingController idController = TextEditingController();
  // TextEditingController vehicle_name = TextEditingController();
  // TextEditingController model_name = TextEditingController();
  // TextEditingController capacity = TextEditingController();
  TextEditingController amount = TextEditingController();
  @override
  void dispose() {
    // idController.dispose();
    // vehicle_name.dispose();
    // model_name.dispose();
    // capacity.dispose();
    amount.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  void Bookslot() async {
    localStorage = await SharedPreferences.getInstance();
    String Login_id = (localStorage.getString('loginId') ?? '');
    print('login id ${Login_id}');
    String charge = "${widget.charging_station_id}";
    print('charging_station_id ${charge}');
    String slot = "${widget.slot}";
    print('slot-no ${slot}');

    amounts = amount.text;
    setState(() {
      _isLoading = true;
    });

    var data = {
      "date": startDate,
      "time": time,
      "login_id": Login_id.replaceAll('"', ''),
      "charging_station_id": charge,
      "slot_no": slot,
      "amount": amount.text,
    };
    print(data);
    var res = await Api().authData(data, '/api/charging/slot-booking');
    var body = json.decode(res.body);

    print(body);
    if (body['success'] == true) {
      print(res);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Payment(amounts)));
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
            'Slot Booking',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://www.ssr-inc.com/wp-content/uploads/EV-charging-1082x546.jpg"),fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: const Text('Booking Date'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Container(
                            height: 45,
                            width: 100,
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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Text(
                          'select Time:',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        DropdownButton<String>(
                          value: time,
                          items: <String>[
                            '10:AM - 11:AM',
                            '11:AM - 12:PM',
                            '12:PM - 1:PM',
                            '1:PM - 2:PM',
                            '2:PM - 3:PM',
                            '3:PM - 4:PM',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              time = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       hintText: "Time",
                  //       icon: Icon(
                  //         Icons.timelapse_rounded,
                  //         color: Colors.blueGrey,
                  //       ),
                  //       border: OutlineInputBorder(),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: amount,
                      decoration: InputDecoration(
                        hintText: "Amount",
                        icon: Icon(
                          Icons.payment,
                          color: Colors.blueGrey,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
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
                          Bookslot();
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => Payment()));
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
                                "Payment",
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
      ),
    );
  }
}
