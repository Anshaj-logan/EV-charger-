import 'package:flutter/material.dart';

import 'addbattery.dart';
class Availablebattery extends StatefulWidget {
  const Availablebattery({super.key});

  @override
  State<Availablebattery> createState() => _AvailablebatteryState();
}

class _AvailablebatteryState extends State<Availablebattery> {

  List Vehicle_name = [
    'Ather',
     'Ola', 
     'Hero Electric Flash',
     'Bajaj Chetak',
      'iQube',
      'Bounce Infinity E1',
      'Hero Electric Optima',
    
  ];
  List Model_name = [
    'Ather 450 Plus Gen 3', 
    'Ola S1 STD', 
    'Hero Electric Flash S1 STD',
    'Bajaj Chetak Premium',
     ' iQube Electric ST',
     'Bounce Infinity E1',
    'Hero Electric Optima Plus',
  ];
  List Capacity = [
    "200 Wh",
    "250 Wh",
    "200 Wh",
    "350 Wh",
    "310 Wh",
    "300 Wh",
    "200 Wh",
  ];
   List Amount = [
    "650/-",
    "700/-",
    "650/-",
    "950/-",
    "900/-",
    "850/-",
    "650/-",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       appBar: AppBar(  
          title: Center(child: Text('BATTERY SHOP')),  
        ),  
        body: ListView.builder(
            itemCount: Vehicle_name.length,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                child: Column(
                  children: [
                    Text(Vehicle_name[position]),
                    Text(Model_name[position]),
                    Text(Capacity[position]),
                    Text(Amount[position]),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: Text('Update')),
                          SizedBox(
                            height: 10,
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text('Delete')),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Addbattery()));
            setState(() {

            });
          },
        ),
        ),
    );
  }
}
