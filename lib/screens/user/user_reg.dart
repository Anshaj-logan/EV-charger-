import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/register_dashboard.dart';
import '../api.dart';
import '../mainloginpage.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isLoading = false;

  _pressCreateAccountButton() {
    UserRegisterUser();
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phnController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    nameController.dispose();
    addressController.dispose();
    phnController.dispose();
    emailController.dispose();
    confirmController.dispose();
    locationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  void UserRegisterUser() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      "name": nameController.text,
      "email": emailController.text,
      "phone_no": phnController.text,
      "location": locationController.text,
      "address": addressController.text,
      "password": passwordController.text,
      "username": usernameController.text,
    };
    print(data);
    var res = await Api().authData(data, '/api/user/register');
    var body = json.decode(res.body);

    print(body);
    if (body['success'] == true) {
      print(res);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RegisterDashBoard(),
              ));
            },
            icon: Icon(Icons.arrow_back)),
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
            'User Signup',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('images/back.jpg'), fit: BoxFit.cover),
        // ),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please choose a name to use";
                        }
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Enter Name",
                        icon: Icon(
                          Icons.person,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please choose a address to use";
                        }
                      },
                      controller: addressController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: "Enter Address",
                        icon: Icon(
                          Icons.location_city,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      validator: (valueMail) {
                        if (valueMail!.isEmpty) {
                          return 'Please enter Email Id';
                        }
                        RegExp email = new RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (email.hasMatch(valueMail)) {
                          return null;
                        } else {
                          return 'Invalid Email Id';
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        icon: Icon(
                          Icons.email_rounded,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Mobile Number';
                        }
                        RegExp number =
                            new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                        if (number.hasMatch(value)) {
                          return null;
                        } else {
                          return 'Invalid Mobile Number';
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: phnController,
                      decoration: InputDecoration(
                        hintText: "+91",
                        icon: Icon(
                          Icons.phone_android,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please choose a name to use";
                        }
                      },
                      controller: locationController,
                      decoration: InputDecoration(
                        hintText: "Enter your location",
                        icon: Icon(
                          Icons.location_history,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please choose a username to use";
                        }
                      },
                      controller: usernameController,
                      // maxLines: 2,
                      decoration: InputDecoration(
                        hintText: "Username",
                        icon: Icon(
                          Icons.person_add_alt_sharp,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      validator: (valuePass) {
                        if (valuePass!.isEmpty) {
                          return 'Please enter your Password';
                        } else if (valuePass.length < 6) {
                          return 'Password too short';
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(
                          Icons.password_outlined,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      validator: (valueConPass) {
                        if (valueConPass!.isEmpty) {
                          return 'Please confirm your Password';
                        } else if (valueConPass.length < 6) {
                          return 'Please check your Password';
                        } else if (valueConPass == passwordController) {
                          return null;
                        }
                      },
                      controller: confirmController,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        icon: Icon(
                          Icons.password_outlined,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.teal),
                      height: 40,
                      //width: 200,
                      child: TextButton(
                        onPressed: () {
                          //   if (_formkey.currentState.validate()) {
                          // print("something");
                          // UserRegisterUser();
                          _pressCreateAccountButton();
                          //  };

                          //  Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
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
                              constraints:
                                  BoxConstraints(maxWidth: 150, minHeight: 40),
                              alignment: Alignment.center,
                              child: Text(
                                "Submit",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              )),
                        ),
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.all(0.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: RichText(
                      text: TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign In',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 16),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ));
                                  })
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
