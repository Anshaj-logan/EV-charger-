import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewBookings extends StatefulWidget {
  const NewBookings({Key? key}) : super(key: key);

  @override
  State<NewBookings> createState() => _NewBookingsState();
}

class _NewBookingsState extends State<NewBookings> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
                title: Text(
                  "Amount",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.build,
                    color: Colors.deepOrange,
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
                ),
          );
        },
        separatorBuilder: (ctx, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: 30);
  }
}
