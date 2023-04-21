import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newpro/register_dashboard.dart';
import 'package:newpro/screens/register.dart';
import 'package:newpro/screens/service/servicestationhome.dart';

import 'package:newpro/screens/user/userhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'battery/batteryshophome.dart';

import 'charging/chargingstationhome.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String user = "2";
  String charge = "1";
  String service = "3";
  String battery = "4";
  String storedvalue = "1";
  late SharedPreferences localStorage;
  String loginId = '';
  String role = '';
  String status = '';
  String chargeid = '';
  bool _isLoading = false;
  bool _obscureText = true;
  final us = TextEditingController();
  final pwd = TextEditingController();

  _pressLoginButton() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'username': us.text.trim(), //username for email
      'password': pwd.text.trim()
    };
    print(data);
    var res = await Api().authData(data, '/api/login');
    var body = json.decode(res.body);

    print(body);
    if (body['success'] == true) {
      //  String login=
      print(body);
      role = json.encode(body['role']);
      status = json.encode(body['status']);
      chargeid = json.encode(body['chargingStationIid']);
      print('user ${user}');
      print('role ${role}');
      print('chargeid ${chargeid}');

      //  print('user ${user.runtimeType}');
      //  print('role ${role.runtimeType}');
      // print('user ${user}');
      // print('role ${role}');
      // print("------");
      // print('storedvalue ${storedvalue}');
      // print('status ${status}');
      // print(user == role);
      // print(status == storedvalue);
      if (user == role.replaceAll('"', '') &&
          storedvalue == status.replaceAll('"', '')) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserHome()));
      } else if (charge == role.replaceAll('"', '') &&
          storedvalue == status.replaceAll('"', '')) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Charginghome(),
        ));
      } else if (service == role.replaceAll('"', '') &&
          storedvalue == status.replaceAll('"', '')) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Servicehome(),
        ));
      } else if (battery == role.replaceAll('"', '') &&
          storedvalue == status.replaceAll('"', '')) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Batteryhome(),
        ));
      } else {
        Fluttertoast.showToast(
          msg: "Please wait for admin approval",
          backgroundColor: Colors.grey,
        );
      }

      localStorage = await SharedPreferences.getInstance();
      localStorage.setString('role', role.toString());
      localStorage.setString(
          'loginId', json.encode(body['login_id']).toString());
      localStorage.setString('U_Id', json.encode(body['user_id']).toString());
      localStorage.setString(
          'chargingStationIid', json.encode(body['chargingStationIid']));
      localStorage.setString(
          'charging_station_name', json.encode(body['charging_station_name']));
      localStorage.setString(
          'batteryShopId', json.encode(body['batteryShopId']));
      localStorage.setString(
          'battery_shop_name', json.encode(body['shopName']));
      localStorage.setString(
          'serviceStationId', json.encode(body['serviceStationId']));
      localStorage.setString(
          'service_station_name', json.encode(body['serviceStationName']));

      String loginid = (localStorage.getString('login_id') ?? '');
      String charge_name =
          (localStorage.getString('charging_station_name') ?? '');
      print('charging name ${charge_name}');
      // String chargeid = (localStorage.getString('chargingStationIid') ?? '');
      print(loginid);
      print(chargeid);
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  String _password = "";

  @override
  void dispose() {
    us.dispose();
    pwd.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _inputField(context),
                _forgotPassword(context),
                _signup(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter your credential to login"),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: us,
          decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person)),
        ),
        SizedBox(height: 10),
        TextField(
          controller: pwd,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _pressLoginButton();
            /* Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        // Servicehome(),
                        // Charginghome()));
                        // Batteryhome()));
                        // UserHome()));
                        _pressLoginButton()));*/
          },
          child: Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        )
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(onPressed: () {}, child: Text("Forgot password?"));
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Dont have an account? "),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterDashBoard()));
            },
            child: Text("Sign Up"))
      ],
    );
  }
}
