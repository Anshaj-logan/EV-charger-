import 'package:flutter/material.dart';
class Bfeedback extends StatefulWidget {
  const Bfeedback({super.key});

  @override
  State<Bfeedback> createState() => _BfeedbackState();
}

class _BfeedbackState extends State<Bfeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
          title: Center(child: Text('FEEDBACK')),  
        ),  
        body:Container(
        height: double.maxFinite,
        width: double.maxFinite,
        //decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://www.ssr-inc.com/wp-content/uploads/EV-charging-1082x546.jpg"),fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Feedbacks",
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