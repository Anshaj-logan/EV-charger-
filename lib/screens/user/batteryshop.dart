// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:newpro/screens/Payment/battery_payment_screen.dart';
//
// class Batteryshop extends StatefulWidget {
//   const Batteryshop({super.key});
//
//   @override
//   State<Batteryshop> createState() => _BatteryshopState();
// }
//
// class _BatteryshopState extends State<Batteryshop> {
//   String dropdownValue = 'Ather';
//   String dropdownValue2 = 'Ather 450 Plus Gen 3';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//               Color(0xFF3FB95C),
//               Color(0xFF3F83B9),
//             ], transform: GradientRotation(90)),
//           ),
//         ),
//         title: Padding(
//           padding: const EdgeInsets.only(left: 50),
//           child: Text(
//             'Battery Shop',
//             style: GoogleFonts.montserrat(
//                 fontWeight: FontWeight.bold, fontSize: 25),
//           ),
//         ),
//       ),
//       body: Container(
//         height: double.maxFinite,
//         width: double.maxFinite,
//         // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://www.ssr-inc.com/wp-content/uploads/EV-charging-1082x546.jpg"),fit: BoxFit.cover)),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AnimatedTextKit(
//                       animatedTexts: [
//                         FadeAnimatedText("Choose Brand...",
//                             textStyle: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.blueGrey,
//                               fontFamily: 'Canterbury',
//                             )),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: DropdownButton<String>(
//                         value: dropdownValue,
//                         items: <String>[
//                           'Ather',
//                           'Ola',
//                           'Hero Electric Flash',
//                           'Bajaj Chetak',
//                           'iQube',
//                           'Bounce Infinity E1',
//                           'Hero Electric Optima'
//                         ].map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(
//                               value,
//                               style: TextStyle(
//                                   fontSize: 17, fontWeight: FontWeight.w400),
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             dropdownValue = newValue!;
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AnimatedTextKit(
//                       animatedTexts: [
//                         FadeAnimatedText("Model Name: ",
//                             textStyle: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.blueGrey,
//                               fontFamily: 'Canterbury',
//                             )),
//                       ],
//                     ),
//                     DropdownButton<String>(
//                       value: dropdownValue2,
//                       items: <String>[
//                         'Ather 450 Plus Gen 3',
//                         'Ola S1 STD',
//                         'Hero Electric Flash S1 STD',
//                         'Bajaj Chetak',
//                         'Bajaj Chetak Premium',
//                         ' iQube Electric ST',
//                         'Bounce Infinity E1',
//                         'Hero Electric Optima Plus'
//                       ].map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: TextStyle(
//                                 fontSize: 17, fontWeight: FontWeight.w400),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           dropdownValue2 = newValue!;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Capacity",
//                       icon: Icon(
//                         Icons.charging_station,
//                         color: Colors.blueGrey,
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Amount",
//                       icon: Icon(
//                         Icons.payment,
//                         color: Colors.blueGrey,
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                               colors: [Color(0xFF3FAAB9), Color(0xFF993FB9)],
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Container(
//                             constraints:
//                                 BoxConstraints(maxWidth: 150, minHeight: 50),
//                             alignment: Alignment.center,
//                             child: Text(
//                               "Book",
//                               style: GoogleFonts.montserrat(
//                                   fontWeight: FontWeight.bold, fontSize: 20),
//                             )),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.all(0.0)),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     Battery_Payment_Screen()));
//                       },
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                               colors: [Color(0xFF3FAAB9), Color(0xFF993FB9)],
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Container(
//                             constraints:
//                                 BoxConstraints(maxWidth: 150, minHeight: 50),
//                             alignment: Alignment.center,
//                             child: Text(
//                               "Payment",
//                               style: GoogleFonts.montserrat(
//                                   fontWeight: FontWeight.bold, fontSize: 20),
//                             )),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.all(0.0)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
