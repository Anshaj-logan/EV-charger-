import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/user/service_slots.dart';
import 'package:newpro/screens/user/servicestation.dart';

class ServiceStaionList extends StatefulWidget {
  const ServiceStaionList({Key? key}) : super(key: key);

  @override
  State<ServiceStaionList> createState() => _ServiceStaionListState();
}

class _ServiceStaionListState extends State<ServiceStaionList> {
  List Available_slots = [
    'Citron',
    'Aether',
    'Tata',
    'MG',
    'OLA',
    'TVS',
  ];
  List place = [
    'Calicut',
    'Calicut',
    'Calicut',
    'Calicut',
    'Calicut',
    'Calicut',
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
            'Service Stations',
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
                          backgroundImage:
                              AssetImage("images/service-center.png"),
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
                            Text(place[position],
                                style: TextStyle(fontSize: 20)),
                            // Text(Amount[position],
                            //     style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AvailableServiceList()));
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
                                  "Book",
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
                  ),
                ],
              ),
            );
          }),
    );
  }
}
