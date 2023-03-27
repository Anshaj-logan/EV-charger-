import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/tab_bar/charge_cmp.dart';
import 'package:newpro/screens/tab_bar/charge_new.dart';
import 'package:newpro/screens/tab_bar/completed_booking.dart';
import 'package:newpro/screens/tab_bar/new_booking.dart';

class Cbookings extends StatefulWidget {
  const Cbookings({super.key});

  @override
  State<Cbookings> createState() => _CbookingsState();
}

class _CbookingsState extends State<Cbookings>
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
              Color(0xFF31B5D9),
              Color(0xFF31B0D9),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
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
              children: [ChargeNew(), ChargeCmp()],
            ),
          ),
        ],
      ),
    );
  }
}
