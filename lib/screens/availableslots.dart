import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'addslots.dart';

class Availableslots extends StatefulWidget {
  const Availableslots({super.key});

  @override
  State<Availableslots> createState() => _AvailableslotsState();
}

class _AvailableslotsState extends State<Availableslots> {
  List Available_slots = [
    'slot 1',
    'slot 4',
    'slot 5',
    'slot 7',
    'slot 8',
    'slot 10',
  ];
  List Amount = [
    '100/- per hour',
    '100/- per hour',
    '100/- per hour',
    '100/- per hour',
    '100/- per hour',
    '100/- per hour',
  ];
  List Duration = [
    'max 6 h',
    'max 4 h',
    'max 6 h',
    ' max 3 h',
    'max 4 h',
    'max 6 h',
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
            'Charging Stations',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: Available_slots.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage("images/slot.png"),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Available_slots[position],
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(Amount[position],
                                style: TextStyle(fontSize: 20)),
                            Text(Duration[position],
                                style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                                  "Update",
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
                                  "Delete",
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
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Addslots()));
          setState(() {});
        },
      ),
    );
  }
}
