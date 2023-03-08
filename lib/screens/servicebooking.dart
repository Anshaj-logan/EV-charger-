import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/tab_bar/completed_booking.dart';
import 'package:newpro/screens/tab_bar/new_booking.dart';

class Servicebooking extends StatefulWidget {
  const Servicebooking({super.key});

  @override
  State<Servicebooking> createState() => _ServicebookingState();
}

class _ServicebookingState extends State<Servicebooking>
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
              children: [NewBookings(), CompletedBookings()],
            ),
          ),
        ],
      ),
    );
  }
}

// SizedBox(
//   height: 10,
// ),
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: TextField(
//     decoration: InputDecoration(
//       hintText: "Bookings",
//       icon: Icon(
//         Icons.view_compact_outlined,
//       ),
//       border: OutlineInputBorder(),
//     ),
//   ),
// ),
// SizedBox(
//   height: 10,
// ),
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: TextField(
//     decoration: InputDecoration(
//       hintText: "Payment Details",
//       icon: Icon(
//         Icons.view_compact_outlined,
//       ),
//       border: OutlineInputBorder(),
//     ),
//   ),
// ),
