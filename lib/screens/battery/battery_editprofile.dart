import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import 'batteryProfile.dart';

class BatteryEditProfile extends StatefulWidget {
  String _id;
  String Log_id;

  BatteryEditProfile(this._id, this.Log_id);

  @override
  State<BatteryEditProfile> createState() => _BatteryEditProfileState();
}

class _BatteryEditProfileState extends State<BatteryEditProfile> {
  bool _isLoading = false;
  String name = "";
  String email = "";
  String phone_no = "";
  String address = "";
  String location = "";
  late SharedPreferences localStorage;
  late String _id;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phone_noController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locationController = TextEditingController();
/*  Future<void> getLogin() async {
    localStorage = await SharedPreferences.getInstance();
    worker_id = (localStorage.getString('_id') ?? '');
    print('worker_id ${worker_id}');
  }*/
  final _formKey = GlobalKey<FormState>();
  @override
  initState() {
    // TODO: implement initState
    super.initState();

    _viewUser();
  }

  Future<void> _viewUser() async {
    _id = widget.Log_id;
    print('Log id ${_id}');
    var res = await Api().getData('/api/user/view-battery-shop-profile/' + _id);
    var body = json.decode(res.body);
    print('body of datas${body}');
    setState(() {
      name = body['data'][0]['name'];
      address = body['data'][0]['address'];
      email = body['data'][0]['email'];
      phone_no = body['data'][0]['phone_no'];
      location = body['data'][0]['location'];

      nameController.text = name;
      addressController.text = address;
      emailController.text = email;
      phone_noController.text = phone_no;
      locationController.text = location;
    });
  }

  _update() async {
    setState(() {
      var _isLoading = true;
    });
    _id = widget._id;
    print('B_id ${_id}');

    var data = {
      "name": nameController.text,
      "address": addressController.text,
      "email": emailController.text,
      "phone_no": phone_noController.text,
      "location": locationController.text,
    };
    print(data);
    var res =
        await Api().authData(data, '/api/user/update-battery-shop/' + _id);
    var body = json.decode(res.body);
    print(res);

    if (body['success'] == true) {
      print(body);

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BatteryProfile()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Update Battery"),
          backgroundColor: Colors.lightBlueAccent,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BatteryProfile(),
                ));
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  buildTextField("name", name, nameController),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("email", email, emailController),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("phone_no", phone_no, phone_noController),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("address", address, addressController),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("location", location, locationController),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.lightBlueAccent),
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _update();
                                });
                              },
                              child: Text(
                                "UPDATE",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        // enabled: false,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          //  hintText: placeholder,
          // hintText:address ,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
