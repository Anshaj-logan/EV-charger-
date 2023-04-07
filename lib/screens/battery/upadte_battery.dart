import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newpro/screens/battery/availablebattery.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class UpdateBattery extends StatefulWidget {
  String B_id;

  UpdateBattery(this.B_id);

  @override
  State<UpdateBattery> createState() => _UpdateBatteryState();
}

class _UpdateBatteryState extends State<UpdateBattery> {
  bool _isLoading = false;
  String amount = "";
  String vehicle_name = "";
  String model_name = "";
  String capacity = "";
  late SharedPreferences localStorage;
  late String B_id;
  TextEditingController amountController = TextEditingController();
  TextEditingController vehicle_nameController = TextEditingController();
  TextEditingController model_nameController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
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
    B_id = widget.B_id;
    print('B_id ${B_id}');
    var res = await Api().getData('/api/battery/view-single-battery/' + B_id);
    var body = json.decode(res.body);
    print('body of datas${body}');
    setState(() {
      vehicle_name = body['data'][0]['vehicle_name'];
      model_name = body['data'][0]['model_name'];
      capacity = body['data'][0]['capacity'];
      amount = body['data'][0]['amount'];

      vehicle_nameController.text = vehicle_name;
      model_nameController.text = model_name;
      capacityController.text = capacity;
      amountController.text = amount;
    });
  }

  _update() async {
    setState(() {
      var _isLoading = true;
    });
    B_id = widget.B_id;
    print('B_id ${B_id}');

    var data = {
      "vehicle_name": vehicle_nameController.text,
      "model_name": model_nameController.text,
      "capacity": capacityController.text,
      "amount": amountController.text,
    };
    print(data);
    var res = await Api().authData(data, '/api/battery/update-battery/' + B_id);
    var body = json.decode(res.body);
    print(res);

    if (body['success'] == true) {
      print(body);

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Availablebattery()));
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
                  builder: (context) => Availablebattery(),
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
                    "vehicle_name", vehicle_name, vehicle_nameController),
                SizedBox(
                  height: 10,
                ),
                buildTextField("model_name", model_name, model_nameController),
                SizedBox(
                  height: 10,
                ),
                buildTextField("capacity", capacity, capacityController),
                SizedBox(
                  height: 10,
                ),
                buildTextField("amount", amount, amountController),
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
