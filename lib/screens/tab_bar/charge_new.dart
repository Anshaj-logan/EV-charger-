import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChargeNew extends StatefulWidget {
  const ChargeNew({Key? key}) : super(key: key);

  @override
  State<ChargeNew> createState() => _ChargeNewState();
}

class _ChargeNewState extends State<ChargeNew> {
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
                    Icons.navigate_next,
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
                  "Slot Number",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 22),
                )),
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
