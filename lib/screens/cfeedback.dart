import 'package:flutter/material.dart';
class Cfeedbacks extends StatefulWidget {
  const Cfeedbacks({super.key});

  @override
  State<Cfeedbacks> createState() => _CfeedbacksState();
}

class _CfeedbacksState extends State<Cfeedbacks> {
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
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Feedback",
                  labelText: "Add your feedback",
                  icon: Icon(Icons.view_compact_outlined,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){}, child: Text("Submit")
          ),
           ],),
          ),
        ),
    );
  }
}