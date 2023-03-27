import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/user/servicestation.dart';

class AvailableServiceList extends StatefulWidget {
  const AvailableServiceList({Key? key}) : super(key: key);

  @override
  State<AvailableServiceList> createState() => _AvailableServiceListState();
}

class _AvailableServiceListState extends State<AvailableServiceList> {
  List Available_Services = [
    'WATER SERVICE',
    'BRAKE FLUID CHANGE',
    'FILTER REPLACEMENT',
    'OVERALL CHECKING',
    'TIRE CHANGE'
  ];
  List Status = [
    'Availble',
    'Not Availble',
    'Availble',
    'Availble',
    'Not Availble',
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
              Color(0xFF3FB95C),
              Color(0xFF3F83B9),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Services',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: Available_Services.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // CircleAvatar(
                        //   radius: 60,
                        //   backgroundImage: AssetImage("images/slot.png"),
                        // ),
                        // SizedBox(
                        //   width: 40,
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Available_Services[position],
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(Status[position],
                                style: TextStyle(fontSize: 20)),
                            // Text(Amount[position],
                            //     style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Servicestation()));
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF3FAAB9),
                                        Color(0xFF993FB9)
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
                                      "Choose",
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
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
