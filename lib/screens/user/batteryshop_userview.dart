import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/Payment/battery_payment_screen.dart';
import 'package:newpro/screens/user/batteryshop.dart';

class AvailableBatteryList extends StatefulWidget {
  const AvailableBatteryList({Key? key}) : super(key: key);

  @override
  State<AvailableBatteryList> createState() => _AvailableBatteryListState();
}

class _AvailableBatteryListState extends State<AvailableBatteryList> {
  List Vehicle_name = [
    'Ather',
    'Ola',
    'Hero Electric',
    'Bajaj Chetak',
    'iQube',
    'Bounce ',
    'Hero Electric'
  ];
  List Model_name = [
    '450 Plus Gen 3',
    'S1 STD',
    'Flash S1 STD',
    'Premium',
    'ST',
    'Infinity E1',
    'Optima Plus'
  ];
  List Capacity = [
    '20AH',
    '22AH',
    '24AH',
    '24AH',
    '20AH',
    '22AH',
    '24AH',
  ];
  List Price = [
    '11000',
    '12000',
    '13000',
    '14000',
    '19000',
    '10000',
    '13000',
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
            'Availble Batteries',
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage("images/batteryev.png"),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Vehicle_name[position],
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(Model_name[position],
                                style: TextStyle(fontSize: 24)),
                            Text(Capacity[position],
                                style: TextStyle(fontSize: 22)),
                            Text("\₹-${Price[position]}",
                                style: TextStyle(fontSize: 22)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Battery_Payment_Screen()));
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
                                  BoxConstraints(maxWidth: 100, minHeight: 30),
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
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
