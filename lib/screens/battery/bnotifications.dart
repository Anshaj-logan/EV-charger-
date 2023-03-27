import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF3FAAB9),
              Color(0xFF993FB9),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            'Notification',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        //decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://www.ssr-inc.com/wp-content/uploads/EV-charging-1082x546.jpg"),fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: "Notifications",
                    labelText: "Add Notifications",
                    icon: Icon(
                      Icons.notification_add_outlined,
                      color: Colors.cyan,
                      size: 30,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF993FB9), Color(0xFF36D931)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 100, minHeight: 30),
                      alignment: Alignment.center,
                      child: Text(
                        "Send",
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
          ),
        ),
      ),
    );
  }
}
