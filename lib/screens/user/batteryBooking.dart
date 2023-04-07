import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Payment/battery_payment_screen.dart';
import '../api.dart';

class BatteryBooking extends StatefulWidget {
  late String battery_shop_id;
  late String B_id;
  late String vehicle_name;
  late String model_name;
  late String capacity;
  late String amount;

  BatteryBooking(this.battery_shop_id, this.B_id, this.vehicle_name,
      this.model_name, this.capacity, this.amount);

  @override
  State<BatteryBooking> createState() => _BatteryBookingState();
}

class _BatteryBookingState extends State<BatteryBooking> {
  DateTime selectedDate = DateTime.now();
  late String startDate;
  bool _isLoading = false;
  late String amounts;
  late String vehiclename;

  late SharedPreferences localStorage;

  final _formKey = GlobalKey<FormState>();
  void Bookbattery() async {
    localStorage = await SharedPreferences.getInstance();
    String Login_id = (localStorage.getString('loginId') ?? '');
    print('login id ${Login_id}');
    String batteryshop_id = "${widget.battery_shop_id}";
    print('batteryshop_id ${batteryshop_id}');
    String B_id = "${widget.B_id}";
    print('B-id ${B_id}');
    String vehicle_name = "${widget.vehicle_name}";
    print('vehicle_name ${vehicle_name}');
    String model_name = "${widget.model_name}";
    print('model_name ${model_name}');
    String capacity = "${widget.capacity}";
    print('capacity ${capacity}');
    String amount = "${widget.amount}";
    print('amount ${amount}');

    vehiclename = vehicle_name;
    amounts = amount;

    setState(() {
      _isLoading = true;
    });

    var data = {
      "date": startDate,
      "battery_id": B_id,
      "login_id": Login_id.replaceAll('"', ''),
      "battery_shop_id": batteryshop_id,
      "vehicle_name": vehicle_name,
      "model_name": model_name,
      "capacity": capacity,
      "amount": amount,
    };
    print(data);
    var res = await Api().authData(data, '/api/battery/battery-booking');
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
                  Battery_Payment_Screen(vehiclename, amounts)));
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
            'Battery Booking',
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
            child: Form(
              key: _formKey,
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
                      ElevatedButton(
                        onPressed: () {
                          Bookbattery();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             Battery_Payment_Screen()));
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
      ),
    );
  }
}
