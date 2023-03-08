import 'package:flutter/material.dart';
class Cnotifications extends StatefulWidget {
  const Cnotifications({super.key});

  @override
  State<Cnotifications> createState() => _CnotificationsState();
}

class _CnotificationsState extends State<Cnotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(  
          title: Center(child: Text('NOTIFICATIONS')),  
        ),  
        body:Container(
        height: double.maxFinite,
        width: double.maxFinite,
       // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://www.ssr-inc.com/wp-content/uploads/EV-charging-1082x546.jpg"),fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Notifications",
                  labelText: "Add Notifications",
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