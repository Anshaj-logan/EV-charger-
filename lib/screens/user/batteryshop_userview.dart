import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/Payment/battery_payment_screen.dart';
import 'package:newpro/screens/user/batteryshop.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import 'batteryBooking.dart';

class AvailableBatteryList extends StatefulWidget {
  late String battery_shop_id;

  AvailableBatteryList(this.battery_shop_id);

  @override
  State<AvailableBatteryList> createState() => _AvailableBatteryListState();
}

class _AvailableBatteryListState extends State<AvailableBatteryList> {
  late SharedPreferences localStrorage;
  late String battery_shop_id;
  late String B_id;
  late String vehicle_name;
  late String model_name;
  late String capacity;
  late String amount;

  List _loadbatterylist = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    String data = "${widget.battery_shop_id}";
    print("idddd${data}");
    var res = await Api().getData('/api/battery/view-battery/' + data);

    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loadbatterylist = items;
      });
    } else {
      setState(() {
        _loadbatterylist = [];
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
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Availble Batteries',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _loadbatterylist.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage("images/batteryev.png"),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              _loadbatterylist[position]['vehicle_name'],
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(_loadbatterylist[position]['model_name'],
                                style: TextStyle(fontSize: 24)),
                            Text(_loadbatterylist[position]['capacity'],
                                style: TextStyle(fontSize: 22)),
                            Text("\₹-${_loadbatterylist[position]['amount']}",
                                style: TextStyle(fontSize: 22)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          battery_shop_id =
                              _loadbatterylist[position]['battery_shop_id'];
                          B_id = _loadbatterylist[position]['_id'];
                          vehicle_name =
                              _loadbatterylist[position]['vehicle_name'];
                          model_name = _loadbatterylist[position]['model_name'];
                          capacity = _loadbatterylist[position]['capacity'];
                          amount = _loadbatterylist[position]['amount'];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BatteryBooking(
                                      battery_shop_id,
                                      B_id,
                                      vehicle_name,
                                      model_name,
                                      capacity,
                                      amount)));
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
                                  BoxConstraints(maxWidth: 100, minHeight: 30),
                              alignment: Alignment.center,
                              child: Text(
                                "Book",
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
                  )
                ],
              ),
            );
          }),
    );
  }
}
