import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/charging/ceditprofile.dart';
import 'package:newpro/screens/charging/chargingstationhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class ChargeProfile extends StatefulWidget {
  const ChargeProfile({Key? key}) : super(key: key);

  @override
  State<ChargeProfile> createState() => _ChargeProfileState();
}

class _ChargeProfileState extends State<ChargeProfile> {
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

    var res = await Api().getData('/api/user/view-charging-station-profile/' +
        Log_id.replaceAll('"', ''));
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
                MaterialPageRoute(builder: (context) => const Charginghome())),
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  Log_id = _loaduserdata[0]['login_id'];
                  _id = _loaduserdata[0]['_id'];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChargeEditProfile(_id, Log_id)));
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

                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: 'First name',
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: 'Last name',
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: 'Email',
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: 'Phone number',
                  //     ),
                  //   ),
                  // ),

                  // ElevatedButton(onPressed: () {}, child: Text('SIGN UP' ,style: TextStyle(fontSize: 15,color: Colors.black))),
                  // ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Travel1())), child: const Text('Sign Up'),)
                ],
              );
            }),
      ),
    );
  }
}
