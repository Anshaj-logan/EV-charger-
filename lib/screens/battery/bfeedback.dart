import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class Bfeedback extends StatefulWidget {
  const Bfeedback({super.key});

  @override
  State<Bfeedback> createState() => _BfeedbackState();
}

class _BfeedbackState extends State<Bfeedback> {
  late SharedPreferences localStrorage;

  late String batteryShopId;

  List _loadfdbklist = [];
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
    batteryShopId = (localStrorage.getString('batteryShopId') ?? '');
    print('new service ${batteryShopId})');

    var res = await Api().getData('/api/user/view-feedback/battery_shop_id/' +
        batteryShopId.replaceAll('"', ''));
    print(res);
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loadfdbklist = items;
      });
    } else {
      setState(() {
        _loadfdbklist = [];
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
              Color(0xFF3FAAB9),
              Color(0xFF993FB9),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Feedback',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, index) {
            return Card(
              child: ListTile(
                  title: Text(
                    'User Name: ${_loadfdbklist[index]['name']}',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  subtitle: Text(
                    _loadfdbklist[index]['feedback'],
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  leading: Text(
                    _loadfdbklist[index]['date'],
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  )),
            );
          },
          separatorBuilder: (ctx, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: _loadfdbklist.length),
    );
  }
}
