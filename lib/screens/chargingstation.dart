import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'Payment/payment_Screen.dart';

class Chargingstation extends StatefulWidget {
  const Chargingstation({super.key});

  @override
  State<Chargingstation> createState() => _ChargingstationState();
}

class _ChargingstationState extends State<Chargingstation> {
  String dropdownValue = 'Slot 1';
  DateTime? _selectDate;
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
            'Charging Station',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://www.ssr-inc.com/wp-content/uploads/EV-charging-1082x546.jpg"),fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        ScaleAnimatedText("Available Slots!..",
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueGrey)),
                      ],
                    ),
                    // Text(
                    //   "AVAILABLE SLOTS:",
                    //   style: GoogleFonts.montserrat(
                    //       fontSize: 18, fontWeight: FontWeight.w600),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        items: <String>[
                          'Slot 1',
                          'Slot 2',
                          'Slot 3',
                          'Slot 4',
                          'Slot 5'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Booking Date:",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    TextButton.icon(
                        onPressed: () async {
                          final _selectdatetemp = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 30)),
                              lastDate: DateTime.now().add(Duration(days: 30)));
                          if (_selectdatetemp == null) {
                            return;
                          } else {
                            print(_selectdatetemp.toString());
                            setState(() {
                              _selectDate = _selectdatetemp;
                            });
                          }
                        },
                        icon: Icon(Icons.calendar_today),
                        label: Text(_selectDate == null
                            ? 'select date'
                            : _selectDate!.toString())),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Time",
                      icon: Icon(
                        Icons.timelapse_rounded,
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
                      hintText: "Duration",
                      icon: Icon(
                        Icons.timer_10_select_sharp,
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
                      hintText: "Amount",
                      icon: Icon(
                        Icons.payment,
                        color: Colors.blueGrey,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
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
                                BoxConstraints(maxWidth: 150, minHeight: 50),
                            alignment: Alignment.center,
                            child: Text(
                              "Book",
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Payment()));
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
                                BoxConstraints(maxWidth: 150, minHeight: 50),
                            alignment: Alignment.center,
                            child: Text(
                              "Payment",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
