import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'mainloginpage.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String dropdownValue = 'User';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF3FB95C),
              Color(0xFF3F83B9),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'User Sign UP',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 27),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  labelText: 'Enter Name',
                  icon: Icon(
                    Icons.person,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Address",
                  labelText: 'Enter Address',
                  icon: Icon(
                    Icons.location_city,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  labelText: 'Enter Phone Number',
                  icon: Icon(
                    Icons.phone_android,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: 'Enter Email',
                  icon: Icon(
                    Icons.email_rounded,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Location",
                  labelText: 'Enter your Location',
                  icon: Icon(
                    Icons.location_history,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "CATAGORY:",
                    style: GoogleFonts.montserrat(fontSize: 20),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    items: <String>[
                      'User',
                      'Charging Station',
                      'Service Station',
                      'Battery Shop'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Selected Value: $dropdownValue',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "User Name",
                  labelText: 'Enter the Username',
                  icon: Icon(
                    Icons.person_add_alt_sharp,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: 'Enter your Password',
                  icon: Icon(
                    Icons.password_outlined,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  labelText: 'Confirm your Password',
                  icon: Icon(
                    Icons.password_sharp,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF3FAAB9), Color(0xFF993FB9)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                    constraints: BoxConstraints(maxWidth: 150, minHeight: 40),
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
    );
  }
}
