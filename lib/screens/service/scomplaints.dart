import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class Scomplaint extends StatefulWidget {
  const Scomplaint({super.key});

  @override
  State<Scomplaint> createState() => _ScomplaintState();
}

class _ScomplaintState extends State<Scomplaint> {
  late SharedPreferences localStrorage;

  late String serviceStationId;

  List _loadcomplaintlist = [];
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
    serviceStationId = (localStrorage.getString('serviceStationId') ?? '');
    print('battery ${serviceStationId})');

    var res = await Api().getData('/api/user/view-complaint-service-station/' +
        serviceStationId.replaceAll('"', ''));
    print(res);
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loadcomplaintlist = items;
      });
    } else {
      setState(() {
        _loadcomplaintlist = [];
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
              Color(0xFFD9C231),
              Color(0xFFFF5733),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Complaints',
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
                    'User Name: ${_loadcomplaintlist[index]['name']}',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  // trailing: IconButton(
                  //   onPressed: () async {
                  //     // _id = _loadbookslotlist[index]['_id'];
                  //     // _completed(_id);
                  //   },
                  //   icon: Icon(
                  //     Icons.reply,
                  //     color: Colors.blue,
                  //     size: 40,
                  //   ),
                  // ),
                  subtitle: Text(
                    _loadcomplaintlist[index]['complaint'],
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                  leading: Text(
                    _loadcomplaintlist[index]['date'],
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 15),
                  )),
            );
          },
          separatorBuilder: (ctx, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: _loadcomplaintlist.length),
    );
  }
}
