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
        leading: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Icon(
              Icons.logout,
              color: Colors.white,
              size: 30,
            )),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ucomplaint()));
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ufeedback()));
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
