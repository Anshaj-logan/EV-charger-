import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import 'charge_cmp.dart';

class ChargeNew extends StatefulWidget {
  const ChargeNew({Key? key}) : super(key: key);

  @override
  State<ChargeNew> createState() => _ChargeNewState();
}

class _ChargeNewState extends State<ChargeNew> {
  late SharedPreferences localStrorage;

  late String chargingStationIid;
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
    chargingStationIid = (localStrorage.getString('chargingStationIid') ?? '');
    print('new charging ${chargingStationIid})');

    var res = await Api().getData(
        '/api/charging/view-accepted-slots-charging-station/' +
            chargingStationIid.replaceAll('"', ''));
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
    var res = await Api()
        .getData('/api/charging/charging-station-complete-booking/' + id);
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print("body of res${body}");

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChargeCmp()));
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
                  _loadbookslotlist[index]['slot_no'],
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600, fontSize: 15),
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
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
                leading: Text(
                  _loadbookslotlist[index]['date'],
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 22),
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
