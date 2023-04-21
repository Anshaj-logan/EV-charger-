import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import 'battery_cmp.dart';

class BatteryNew extends StatefulWidget {
  const BatteryNew({Key? key}) : super(key: key);

  @override
  State<BatteryNew> createState() => _BatteryNewState();
}

class _BatteryNewState extends State<BatteryNew> {
  late SharedPreferences localStrorage;

  late String batteryShopId;
  late String _id;

  List _loadbookslotlist = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    localStrorage = await SharedPreferences.getInstance();
    batteryShopId = (localStrorage.getString('batteryShopId') ?? '');
    print('batteryshop Id ${batteryShopId})');

    var res = await Api().getData(
        '/api/battery/view-booked-batteries-battery-shop/' +
            batteryShopId.replaceAll('"', ''));
    print(res);
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loadbookslotlist = items;
      });
    } else {
      setState(() {
        _loadbookslotlist = [];
      });
    }
  }

  _completed(String id) async {
    setState(() {
      var _isLoading = true;
    });

    var data = {"_id": id};
    print(data);
    var res = await Api().getData('/api/battery/accept-completed/' + id);
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print("body of res${body}");

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BatteryCmp()));
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
    return ListView.separated(
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
                title: Text(
                  _loadbookslotlist[index]['vehicle_name'],
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                trailing: IconButton(
                  onPressed: () async {
                    _id = _loadbookslotlist[index]['_id'];
                    _completed(_id);
                  },
                  icon: Icon(
                    Icons.navigate_next,
                    color: Colors.green,
                    size: 40,
                  ),
                ),
                subtitle: Text(
                  '\₹ - ${_loadbookslotlist[index]['amount']}',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                leading: Text(
                  _loadbookslotlist[index]['date'],
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
        itemCount: _loadbookslotlist.length);
  }
}
