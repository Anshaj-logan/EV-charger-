import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChargeCmp extends StatefulWidget {
  const ChargeCmp({Key? key}) : super(key: key);

  @override
  State<ChargeCmp> createState() => _ChargeCmpState();
}

class _ChargeCmpState extends State<ChargeCmp> {
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
                "Slot Number",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold, fontSize: 22),
              ));
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
        itemCount: 20);
  }
}
