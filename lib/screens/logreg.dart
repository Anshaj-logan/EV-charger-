// import 'package:flutter/material.dart';
// import 'package:newpro/screens/register.dart';
// import 'batteryshophome.dart';
// import 'chargingstationhome.dart';
// import 'login.dart';
// import 'servicestationhome.dart';
//
// class LogReg extends StatefulWidget {
//   const LogReg({super.key});
//
//   @override
//   State<LogReg> createState() => _LogRegState();
// }
//
// class _LogRegState extends State<LogReg> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('BEVs SOLUTIONS')),
//       ),
//       body: Container(
//         height: double.maxFinite,
//         width: double.maxFinite,
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: NetworkImage(
//                     "https://www.ssr-inc.com/wp-content/uploads/EV-charging-1082x546.jpg"),
//                 fit: BoxFit.cover)),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Login()));
//                   },
//                   child: Text("LOGIN")),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Register()));
//                   },
//                   child: Text("REGISTER")),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Batteryhome()));
//                   },
//                   child: Text("BatteryLogin")),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Servicehome()));
//                   },
//                   child: Text("ServiceLogin")),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Charginghome()));
//                   },
//                   child: Text("ChargingLogin")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
