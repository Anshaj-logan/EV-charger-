import 'package:flutter/material.dart';
class Ccomplaints extends StatefulWidget {
  const Ccomplaints({super.key});

  @override
  State<Ccomplaints> createState() => _CcomplaintsState();
}

class _CcomplaintsState extends State<Ccomplaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
          title: Center(child: Text('COMPLAINTS')),  
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
            TextField(
              decoration: InputDecoration(
                hintText: "Complaints",
                icon: Icon(Icons.view_compact_outlined,
                ),
                border: OutlineInputBorder(),
              ),
            ),
             SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                hintText: "Replay",
                labelText: "Add your replay",
                icon: Icon(Icons.view_compact_outlined,
                ),
                border: OutlineInputBorder(),
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