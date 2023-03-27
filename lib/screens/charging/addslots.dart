import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Addslots extends StatefulWidget {
  const Addslots({super.key});

  @override
  State<Addslots> createState() => _AddslotsState();
}

class _AddslotsState extends State<Addslots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF31B5D9),
              Color(0xFF31B0D9),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Add New Slots',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "New Slot",
                      icon: Icon(
                        Icons.text_fields_sharp,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Status",
                      icon: Icon(
                        Icons.flash_on_rounded,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF31B5D9), Color(0xFF36D931)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 100, minHeight: 30),
                        alignment: Alignment.center,
                        child: Text(
                          "Add",
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
