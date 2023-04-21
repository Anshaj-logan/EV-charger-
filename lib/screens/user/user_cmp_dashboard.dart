import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:newpro/screens/user/ubattery_cmpv.dart';
import 'package:newpro/screens/user/ucharge_cmpv.dart';
import 'package:newpro/screens/user/ucomplaintv.dart';

class UserCmpDashboard extends StatefulWidget {
  const UserCmpDashboard({Key? key}) : super(key: key);

  @override
  State<UserCmpDashboard> createState() => _UserCmpDashboardState();
}

class _UserCmpDashboardState extends State<UserCmpDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText("Add Complaints",
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
          GridView(
              shrinkWrap: true,
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ucomplaint()));
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
                        Text("Service-Station",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UChargeCmp()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.charging_station,
                            size: 50, color: Colors.white),
                        Text("Charging-Station",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UbatteryCmp()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shop, size: 50, color: Colors.white),
                        Text("Battery-shop",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white)),
                      ],
                    ),
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
