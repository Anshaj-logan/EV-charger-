import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class NewBookings extends StatefulWidget {
  const NewBookings({Key? key}) : super(key: key);

  @override
  State<NewBookings> createState() => _NewBookingsState();
}

class _NewBookingsState extends State<NewBookings> {
  late SharedPreferences localStrorage;

  late String serviceStationId;

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
    serviceStationId = (localStrorage.getString('serviceStationId') ?? '');
    print('new charging ${serviceStationId})');

    var res = await Api().getData('/api/station/view-booked-service-station/' +
        serviceStationId.replaceAll('"', ''));
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
          return Card(
            child: ListTile(
                title: Text(
                  _loadbookslotlist[index]['service_name'],
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.build,
                    color: Colors.deepOrange,
                    size: 40,
                  ),
                ),
                subtitle: Text(
                  '\₹ - ${_loadbookslotlist[index]['amount']}',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800, fontSize: 18),
                ),
                leading: Text(
                  _loadbookslotlist[index]['date'],
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600, fontSize: 15),
                )
                // CircleAvatar(
                //   radius: 30,
                //   backgroundColor: Colors.green,
                //   backgroundImage: AssetImage("images/images87.jpeg"),
                // ),
                ),
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
