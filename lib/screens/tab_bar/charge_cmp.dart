import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class ChargeCmp extends StatefulWidget {
  const ChargeCmp({Key? key}) : super(key: key);

  @override
  State<ChargeCmp> createState() => _ChargeCmpState();
}

class _ChargeCmpState extends State<ChargeCmp> {
  late SharedPreferences localStrorage;

  late String chargingStationIid;

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
        '/api/charging/completed/' + chargingStationIid.replaceAll('"', ''));
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

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, index) {
          return ListTile(
              title: Text(
                _loadbookslotlist[index]['slot_no'],
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600, fontSize: 15),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.done_all_sharp,
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
              ));
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
        itemCount: _loadbookslotlist.length);
  }
}
