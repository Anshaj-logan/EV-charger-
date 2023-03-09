import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'addbattery.dart';

class Availablebattery extends StatefulWidget {
  const Availablebattery({super.key});

  @override
  State<Availablebattery> createState() => _AvailablebatteryState();
}

class _AvailablebatteryState extends State<Availablebattery> {
  List Vehicle_name = [
    'Ather',
    'Ola',
    'Hero Electric Flash',
    'Bajaj Chetak',
    'iQube',
    'Bounce Infinity E1',
    'Hero Electric Optima',
  ];
  List Model_name = [
    'Ather 450 Plus Gen 3',
    'Ola S1 STD',
    'Hero Electric Flash S1 STD',
    'Bajaj Chetak Premium',
    ' iQube Electric ST',
    'Bounce Infinity E1',
    'Hero Electric Optima Plus',
  ];
  List Capacity = [
    "200 Wh",
    "250 Wh",
    "200 Wh",
    "350 Wh",
    "310 Wh",
    "300 Wh",
    "200 Wh",
  ];
  List Amount = [
    "650/-",
    "700/-",
    "650/-",
    "950/-",
    "900/-",
    "850/-",
    "650/-",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              'Battery Shop',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: Vehicle_name.length,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("images/batteryev.png"),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              Text(
                                Vehicle_name[position],
                                style: TextStyle(fontSize: 25),
                              ),
                              Text(
                                Model_name[position],
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                Capacity[position],
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                Amount[position],
                                style: TextStyle(fontSize: 18),
                              ),
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
                                      Color(0xFF993FB9),
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
                                      Color(0xFF993FB9),
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
                context, MaterialPageRoute(builder: (context) => Addbattery()));
            setState(() {});
          },
        ),
      ),
    );
  }
}
