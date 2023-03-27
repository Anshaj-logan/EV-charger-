import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/service/scomplaints.dart';
import 'package:newpro/screens/service/servicebooking.dart';
import 'package:newpro/screens/service/sfeedback.dart';
import 'package:newpro/screens/service/snotification.dart';
import '../mainloginpage.dart';
import 'availableservices.dart';

class Servicehome extends StatefulWidget {
  const Servicehome({super.key});

  @override
  State<Servicehome> createState() => _ServicehomeState();
}

class _ServicehomeState extends State<Servicehome> {
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
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              'Service Station',
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
                image: AssetImage("images/ev.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Availableservices()));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFD1D931), Color(0xFF3F83B9)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 200, minHeight: 50),
                      alignment: Alignment.center,
                      child: Text(
                        "Available Services",
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
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Servicebooking()));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFD1D931), Color(0xFF3F83B9)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 200, minHeight: 50),
                      alignment: Alignment.center,
                      child: Text(
                        "Bookings",
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
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 70),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Snotifications()));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFD1D931), Color(0xFF3F83B9)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 200, minHeight: 50),
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
            ),
            SizedBox(
              height: 31,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 160),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Scomplaint()));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFD1D931), Color(0xFF3F83B9)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 200, minHeight: 50),
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
            ),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Sfeedback()));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFD1D931), Color(0xFF3F83B9)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 150, minHeight: 40),
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
            ),
          ]),
        ),
      ),
    );
  }
}
