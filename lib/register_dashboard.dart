import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:newpro/screens/battery/battery_reg.dart';
import 'package:newpro/screens/charging/charging_station_reg.dart';
import 'package:newpro/screens/mainloginpage.dart';
import 'package:newpro/screens/service/service_station_reg.dart';
import 'package:newpro/screens/user/user_reg.dart';

class RegisterDashBoard extends StatefulWidget {
  const RegisterDashBoard({
    super.key,
  });
  // final String title;
  // required this.title

  @override
  State<RegisterDashBoard> createState() => _RegisterDashBoardState();
}

class _RegisterDashBoardState extends State<RegisterDashBoard> {
  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                Center(
                  child: Text(title,
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EV"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),

        /// elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText("Registration",
                    textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey)),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          //  GridView.count(
          //   shrinkWrap: true,
          //    crossAxisCount: 2,
          //    padding: EdgeInsets.all(3.0),
          //    children: <Widget>[
          //      makeDashboardItem("USER", Icons.person_2),
          //      makeDashboardItem("COMPANY", Icons.business),
          //      makeDashboardItem("DEPARTMENT", Icons.factory),
          //    ],
          //  ),
          GridView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserRegister()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 50, color: Colors.white),
                      Text("USER",
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ServiceRegister()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.electrical_services,
                          size: 50, color: Colors.white),
                      Text("Service Station",
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BatteryshopRegister()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shop, size: 50, color: Colors.white),
                      Text("Batteryshop",
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChargingRegister()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orangeAccent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.charging_station,
                          size: 50, color: Colors.white),
                      Text("Charging Staion",
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
