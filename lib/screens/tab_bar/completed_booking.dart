import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletedBookings extends StatefulWidget {
  const CompletedBookings({Key? key}) : super(key: key);

  @override
  State<CompletedBookings> createState() => _CompletedBookingsState();
}

class _CompletedBookingsState extends State<CompletedBookings> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, index) {
          return ListTile(
              title: Text(
                "Amount",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600, fontSize: 15),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.done_all_sharp,
                  color: Colors.green,
                  size: 40,
                ),
              ),
              subtitle: Text(
                "$index:00 AM",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600, fontSize: 15),
              ),
              leading: Text(
                "Break fluid change",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold, fontSize: 18),
              )
              // CircleAvatar(
              //   radius: 30,
              //   backgroundColor: Colors.green,
              //   backgroundImage: AssetImage("images/images87.jpeg"),
              // ),
              );
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
        itemCount: 100);
  }
}
