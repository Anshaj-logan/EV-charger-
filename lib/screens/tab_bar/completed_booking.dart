import 'package:flutter/material.dart';

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
            title: Text("Break fluid change $index"),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.done_all_sharp,
                color: Colors.green,
              ),
            ),
            subtitle: Text("$index:00 AM"),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green,
              backgroundImage: AssetImage("images/images87.jpeg"),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
        itemCount: 100);
  }
}
