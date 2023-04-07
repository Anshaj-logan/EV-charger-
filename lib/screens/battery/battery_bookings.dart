import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../tab_bar/battery_cmp.dart';
import '../tab_bar/battery_new.dart';

class BatteryBookings extends StatefulWidget {
  const BatteryBookings({Key? key}) : super(key: key);

  @override
  State<BatteryBookings> createState() => _BatteryBookingsState();
}

class _BatteryBookingsState extends State<BatteryBookings>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
            'Bookings',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: "New",
              ),
              Tab(text: "Completed"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [BatteryNew(), BatteryCmp()],
            ),
          ),
        ],
      ),
    );
  }
}
