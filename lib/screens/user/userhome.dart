import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/constants.dart';
import 'package:newpro/screens/mainloginpage.dart';
import 'package:newpro/screens/user/batteryshop_list.dart';
import 'package:newpro/screens/user/batteryshop_userview.dart';
import 'package:newpro/screens/user/chargingstation_userview.dart';
import 'package:newpro/screens/user/servicestaion_userview.dart';

import 'package:newpro/screens/user/servicestation.dart';

import 'package:newpro/screens/user/ucomplaintv.dart';
import 'package:newpro/screens/user/ufeedbackv.dart';
import 'package:newpro/screens/user/userProfile.dart';
import 'package:newpro/screens/user/user_cmp_dashboard.dart';
import 'package:newpro/screens/user/user_fdbk_dashboard.dart';

import 'Unotification.dart';
import 'batteryshop.dart';
import 'chargingstation.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
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
            'User Home',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserNotification()));
              },
              icon: Icon(Icons.notifications)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff00ADB5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/splash_logo.png'),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    'BEVs',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_box,
              ),
              title: const Text('My Account'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => UserProfile()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: const Text('Log out'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/userhome.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChargingStationList()
                            // Chargingstation()
                            ));
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
                            BoxConstraints(maxWidth: 200, minHeight: 50),
                        alignment: Alignment.center,
                        child: Text(
                          "Charging Station",
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
                kheight,
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceStaionList()));
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
                            BoxConstraints(maxWidth: 200, minHeight: 50),
                        alignment: Alignment.center,
                        child: Text(
                          "Service Station",
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
                kheight,
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BatteryShopList()));
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
                              BoxConstraints(maxWidth: 200, minHeight: 50),
                          alignment: Alignment.center,
                          child: Text(
                            "Battery Shop",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.all(0.0))),
                kheight,
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserCmpDashboard()));
                    // Ucomplaint()));
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
                            BoxConstraints(maxWidth: 200, minHeight: 50),
                        alignment: Alignment.center,
                        child: Text(
                          "Complaints",
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
                kheight,
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserFeedbackDashboard()));
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
                            BoxConstraints(maxWidth: 200, minHeight: 50),
                        alignment: Alignment.center,
                        child: Text(
                          "Feedbacks",
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
              ]),
        ),
      ),
    );
  }
}
