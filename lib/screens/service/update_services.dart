import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import 'availableservices.dart';

class UpdateServices extends StatefulWidget {
  String _id;

  UpdateServices(this._id);

  @override
  State<UpdateServices> createState() => _UpdateServicesState();
}

class _UpdateServicesState extends State<UpdateServices> {
  bool _isLoading = false;
  String amount = "";
  String service_name = "";
  String duration = "";

  late SharedPreferences localStorage;
  late String S_id;
  TextEditingController amountController = TextEditingController();
  TextEditingController service_nameController = TextEditingController();
  TextEditingController durationController = TextEditingController();

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

    _viewBattery();
  }

  Future<void> _viewBattery() async {
    S_id = widget._id;
    print('B_id ${S_id}');
    var res = await Api().getData('/api/station/view-single-station/' + S_id);
    var body = json.decode(res.body);
    print('body of datas${body}');
    setState(() {
      service_name = body['data'][0]['service_name'];
      duration = body['data'][0]['duration'];
      amount = body['data'][0]['amount'];

      service_nameController.text = service_name;
      durationController.text = duration;

      amountController.text = amount;
    });
  }

  _update() async {
    setState(() {
      var _isLoading = true;
    });
    S_id = widget._id;
    print('B_id ${S_id}');

    var data = {
      "service_name": service_nameController.text,
      "duration": durationController.text,
      "amount": amountController.text,
    };
    print(data);
    var res = await Api().authData(data, '/api/station/update-service/' + S_id);
    var body = json.decode(res.body);
    print(res);

    if (body['success'] == true) {
      print(body);

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Availableservices()));
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
                  builder: (context) => Availableservices(),
                ));
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Container(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                buildTextField(
                    "Service_name", service_name, service_nameController),
                SizedBox(
                  height: 10,
                ),
                buildTextField("amount", amount, amountController),
                SizedBox(
                  height: 10,
                ),
                buildTextField("duration", duration, durationController),
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
                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(50),
                    //           color: Colors.lightBlueAccent),
                    //       height: 50,
                    //       child: TextButton(
                    //         onPressed: () {
                    //           setState(() {
                    //             _update();
                    //           });
                    //         },
                    //         child: Text(
                    //           "Update",
                    //           style: TextStyle(
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.white),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
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
