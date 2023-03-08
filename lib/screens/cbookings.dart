import 'package:flutter/material.dart';
class Cbookings extends StatefulWidget {
  const Cbookings({super.key});

  @override
  State<Cbookings> createState() => _CbookingsState();
}

class _CbookingsState extends State<Cbookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
          title: Center(child: Text('BOOKINGS')),  
        ),  
        body:Container(
        height: double.maxFinite,
        width: double.maxFinite,
       // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://www.ssr-inc.com/wp-content/uploads/EV-charging-1082x546.jpg"),fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Bookings",
                  icon: Icon(Icons.view_compact_outlined,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
             SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Payment Details",
                  icon: Icon(Icons.view_compact_outlined,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
           ],),
          ),
        ),
    );
  }
}