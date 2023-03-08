import 'package:flutter/material.dart';
class Bcomplaint extends StatefulWidget {
  const Bcomplaint({super.key});

  @override
  State<Bcomplaint> createState() => _BcomplaintState();
}

class _BcomplaintState extends State<Bcomplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     appBar: AppBar(  
          title: Center(child: Text('COMPLAINTS')),  
        ),  
        body:Container(
          height: double.maxFinite,
          width: double.maxFinite,
        
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
        
    );
  }
}