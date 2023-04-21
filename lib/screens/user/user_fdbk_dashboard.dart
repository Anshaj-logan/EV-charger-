import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:newpro/screens/user/ucharge_fdbk.dart';
import 'package:newpro/screens/user/ufeedbackv.dart';

import 'Ubattery_fdbk.dart';

class UserFeedbackDashboard extends StatefulWidget {
  const UserFeedbackDashboard({Key? key}) : super(key: key);

  @override
  State<UserFeedbackDashboard> createState() => _UserFeedbackDashboardState();
}

class _UserFeedbackDashboardState extends State<UserFeedbackDashboard> {
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
                WavyAnimatedText("Add Feedbacks",
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
                        MaterialPageRoute(builder: (context) => Ufeedback()));
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
                        MaterialPageRoute(builder: (context) => UchargeFdbk()));
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UBatteryfdbk()));
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
