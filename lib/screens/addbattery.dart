import 'package:flutter/material.dart';
class Addbattery extends StatefulWidget {
  const Addbattery({super.key});

  @override
  State<Addbattery> createState() => _AddbatteryState();
}

class _AddbatteryState extends State<Addbattery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(  
          title: Center(child: Text('CHARGING STATIONS')),  
        ), 
        body: Container(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Center(
             child: Column(
              children: [
                SizedBox(height: 20, ),
                TextField(
                   decoration: InputDecoration(
                  hintText: "Vehicle Name",
                  icon: Icon(Icons.moped,
                  ),
                  border: OutlineInputBorder(),
                   ),
                ),
                 SizedBox(height: 20, ),
                TextField(
                   decoration: InputDecoration(
                  hintText: "Model Name",
                  icon: Icon(Icons.table_rows_outlined,
                  ),
                  border: OutlineInputBorder(),
                   ),
                ),
                 SizedBox(height: 20, ),
                TextField(
                   decoration: InputDecoration(
                  hintText: "Capacity",
                  icon: Icon(Icons.warehouse,
                  ),
                  border: OutlineInputBorder(),
                   ),
                ),
                 SizedBox(height: 20, ),
                TextField(
                   decoration: InputDecoration(
                  hintText: "Amount",
                  icon: Icon(Icons.money,
                  ),
                  border: OutlineInputBorder(),
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