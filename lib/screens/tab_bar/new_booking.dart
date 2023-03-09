import 'package:flutter/material.dart';

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
              title: Text("Break fluid change $index"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.build,
                  color: Colors.deepOrange,
                ),
              ),
              subtitle: Text("$index:00 AM"),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
                backgroundImage: AssetImage("images/images87.jpeg"),
              ),
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
