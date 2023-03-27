import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bcomplaint extends StatefulWidget {
  const Bcomplaint({super.key});

  @override
  State<Bcomplaint> createState() => _BcomplaintState();
}

class _BcomplaintState extends State<Bcomplaint> {
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
            'Complaints',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.comment,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 310,
                      height: 200,
                      decoration: (BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                      child: Center(
                        child: Text(
                            " i have some issue after my break fluid change , Can u fix this asap"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Replay",
                  labelText: "Add your replay",
                  icon: Icon(
                    Icons.reply,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF993FB9), Color(0xFF36D931)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 120, minHeight: 40),
                      alignment: Alignment.center,
                      child: Text(
                        "Send",
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
    );
  }
}
