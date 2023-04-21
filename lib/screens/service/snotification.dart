import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/screens/service/servicestationhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class Snotifications extends StatefulWidget {
  const Snotifications({super.key});

  @override
  State<Snotifications> createState() => _SnotificationsState();
}

class _SnotificationsState extends State<Snotifications> {
  bool _isLoading = false;
  late String serviceStationId;
  late String service_station_name;
  late SharedPreferences localStorage;

  TextEditingController notification = TextEditingController();

  @override
  void dispose() {
    // idController.dispose();
    notification.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllId();
  }

  List service = [];
  String? selectId;
  Future getAllId() async {
    var res = await Api().getData('/api/user/view-user');
    var body = json.decode(res.body);

    print(res);
    setState(() {
      print(body);
      service = body['data'];
      // depart_id = body['data'][0]['_id'];
    });
  }

  final _formKey = GlobalKey<FormState>();
  void AddNotification() async {
    localStorage = await SharedPreferences.getInstance();
    serviceStationId = (localStorage.getString('serviceStationId') ?? '');
    print('User login ${serviceStationId}');
    service_station_name =
        (localStorage.getString('service_station_name') ?? '');
    print('service name ${service_station_name}');
    setState(() {
      _isLoading = true;
    });

    var data = {
      "service_station_id": serviceStationId.replaceAll('"', ''),
      "service_station_name": service_station_name.replaceAll('"', ''),
      "date": startDate,
      "notification": notification.text,
      "user_id": selectId,
    };
    print(data);
    var res = await Api().authData(data, '/api/user/add-notification');
    var body = json.decode(res.body);

    print(body);
    if (body['success'] == true) {
      print(res);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Servicehome()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  DateTime selectedDate = DateTime.now();
  late String startDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        startDate =
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
      });
    }
  }

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
            'Add Notification',
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        hint: Text('choose user'),
                        style: TextStyle(color: Colors.black),
                        value: selectId,
                        items: service
                            .map((type) => DropdownMenuItem<String>(
                                  value: type['_id'].toString(),
                                  child: Text(
                                    type['name'].toString(),
                                    style: TextStyle(color: Colors.black26),
                                  ),
                                ))
                            .toList(),
                        onChanged: (type) {
                          setState(() {
                            selectId = type;
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: const Text('Select date'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    height: 45,
                    width: 150,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                        style: TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: notification,
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 7,
                    decoration: InputDecoration(
                      hintText: "Add Notification",
                      labelText: "Add Notification",
                      icon: Icon(
                        Icons.message,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      AddNotification();
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
                              BoxConstraints(maxWidth: 150, minHeight: 50),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
