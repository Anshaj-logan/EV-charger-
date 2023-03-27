import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/constants.dart';
import '../mainloginpage.dart';
import 'availablebattery.dart';
import 'bcomplaint.dart';
import 'bfeedback.dart';
import 'bnotifications.dart';

class Batteryhome extends StatefulWidget {
  const Batteryhome({super.key});

  @override
  State<Batteryhome> createState() => _BatteryhomeState();
}

class _BatteryhomeState extends State<Batteryhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF3FAAB9),
                Color(0xFF993FB9),
              ], transform: GradientRotation(90)),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              'BEVs Solutions',
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
              ))),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/batteryhome.jpg"), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 28,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Availablebattery()));
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF3FB95C), Color(0xFF3F83B9)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 200, minHeight: 50),
                        alignment: Alignment.center,
                        child: Text(
                          "Available Battery",
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
                kheight1,
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()));
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF3FB95C), Color(0xFF3F83B9)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 200, minHeight: 50),
                        alignment: Alignment.center,
                        child: Text(
                          "Notifications",
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
                kheight1,
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bcomplaint()));
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF3FB95C), Color(0xFF3F83B9)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 200, minHeight: 50),
                        alignment: Alignment.center,
                        child: Text(
                          "Complaiints",
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
                kheight1,
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bfeedback()));
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF3FB95C), Color(0xFF3F83B9)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 200, minHeight: 50),
                        alignment: Alignment.center,
                        child: Text(
                          "Feedback",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
