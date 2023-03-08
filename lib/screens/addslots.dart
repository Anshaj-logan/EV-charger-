import 'package:flutter/material.dart';
class Addslots extends StatefulWidget {
  const Addslots({super.key});

  @override
  State<Addslots> createState() => _AddslotsState();
}

class _AddslotsState extends State<Addslots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(  
          title: Center(child: Text('ADD NEW SLOTS')),  
        ), 
        body:Container(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Center(
             child: Column(
              children: [
                 SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  decoration: InputDecoration(
                    hintText: "New Slot",
                    icon: Icon(Icons.text_fields_sharp,
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
                  hintText: "Amount",
                  icon: Icon(Icons.money,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
         
             SizedBox(height: 40,width: 20,),
            ElevatedButton(onPressed: (){},child: Text("Add")
            ),
              ],
             ),
           ),
          ),

        ),
    );
  }
}