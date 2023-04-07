import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/service/service_editprofile.dart';
import 'package:newpro/screens/service/servicestationhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class ServiceProfile extends StatefulWidget {
  const ServiceProfile({Key? key}) : super(key: key);

  @override
  State<ServiceProfile> createState() => _ServiceProfileState();
}

class _ServiceProfileState extends State<ServiceProfile> {
  late SharedPreferences localStrorage;
  String User_name = "";
  String place = "";
  String email = "";
  String phone_no = "";
  late String location;
  late String Log_id;
  late String _id;

  List _loaduserdata = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
    // _fetchDel();
  }

  _fetchData() async {
    localStrorage = await SharedPreferences.getInstance();
    Log_id = (localStrorage.getString('loginId') ?? '');
    print('Log id ${Log_id}');

    var res = await Api().getData(
        '/api/user/view-service-station-profile/' + Log_id.replaceAll('"', ''));
    print(res);

    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print('profile data${items}');
      // var name = [items][4];
      // print(name);
      // var _id = ['_id'];
      // print(_id);
      setState(() {
        _loaduserdata = items;
      });
    } else {
      setState(() {
        _loaduserdata = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My account"),
          leading: IconButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Servicehome())),
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  _id = _loaduserdata[0]['_id'];
                  Log_id = _loaduserdata[0]['login_id'];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ServiceEditProfile(_id, Log_id)));
                },
                icon: Icon(Icons.edit),
                tooltip: "Edit profile"),
          ],
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: _loaduserdata.length,
            itemBuilder: (BuildContext context, int position) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "images/pro.png",
                      ),
                      radius: 60,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      width: 320,
                      height: 500,
                      // color: Colors.green,
                      child: Column(
                        children: [
                          Text(_loaduserdata[position]['name'],
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(_loaduserdata[position]['email'],
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(_loaduserdata[position]['phone_no'],
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(_loaduserdata[position]['address'],
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(_loaduserdata[position]['location'],
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
