import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Snotifications extends StatefulWidget {
  const Snotifications({super.key});

  @override
  State<Snotifications> createState() => _SnotificationsState();
}

class _SnotificationsState extends State<Snotifications> {
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
            'Notifications',
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
                    gradient: LinearGradient(colors: [
                      Color(0xFFD9C231),
                      Color(0xFF18A6E4),
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 150, minHeight: 50),
                      alignment: Alignment.center,
                      child: Text(
                        "Submit",
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
