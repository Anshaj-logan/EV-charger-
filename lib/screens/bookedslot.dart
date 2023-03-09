import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookedslots extends StatefulWidget {
  const Bookedslots({super.key});

  @override
  State<Bookedslots> createState() => _BookedslotsState();
}

class _BookedslotsState extends State<Bookedslots> {
  List Booked_slots = [
    'slot 2',
    'slot 3',
    'slot 6',
    'slot 9',
  ];
  List Amount = [
    '500/-',
    '400/-',
    '600/-',
    '300/-',
  ];
  List Duration = [
    '5 h',
    '4 h',
    '6 h',
    '3 h',
  ];
  List Date = [
    '2.3.2023',
    '3.5.2023',
    '4.3.2023',
    '5.3.2023',
  ];
  List Time = [
    '5:00 PM',
    '4:30 PM',
    '6:00 PM',
    '11:30 AM',
  ];
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
            'Booked Slots',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: Booked_slots.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/slot.png"),
                  ),
                  Column(
                    children: [
                      Text(Booked_slots[position],
                          style: TextStyle(fontSize: 25)),
                      Text(Amount[position], style: TextStyle(fontSize: 22)),
                      Text(
                        Duration[position],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(Date[position], style: TextStyle(fontSize: 20)),
                      Text(Time[position], style: TextStyle(fontSize: 20)),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF31B5D9),
                                        Color(0xFF36D931)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 100, minHeight: 30),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Confirm",
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.all(0.0)),
                            ),
                            SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF36D931),
                                        Color(0xFFF71512)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 100, minHeight: 30),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Reject",
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
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
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
