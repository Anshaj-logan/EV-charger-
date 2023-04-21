import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class UserNotification extends StatefulWidget {
  const UserNotification({Key? key}) : super(key: key);

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
  late SharedPreferences localStrorage;

  late String U_Id;

  List _loadnotlist = [];
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
    U_Id = (localStrorage.getString('U_Id') ?? '');
    print('User_id ${U_Id}');

    var res = await Api()
        .getData('/api/user/view-notification/' + U_Id.replaceAll('"', ''));
    print(res);
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loadnotlist = items;
      });
    } else {
      setState(() {
        _loadnotlist = [];
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
            'Notification',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, index) {
            return Card(
              child: ListTile(
                  leading: Text(
                    _loadnotlist[index]['charging_name'] != null
                        ? _loadnotlist[index]['charging_name']
                        : _loadnotlist[index]['service_name'] != null
                            ? _loadnotlist[index]['service_name']
                            : _loadnotlist[index]['battery_name'] != null
                                ? _loadnotlist[index]['battery_name']
                                : "",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  title: Text(
                    _loadnotlist[index]['notification'],
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  trailing: Text(
                    _loadnotlist[index]['date'],
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
          itemCount: _loadnotlist.length),
    );
  }
}
