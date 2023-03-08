import 'package:flutter/material.dart';
class Bookedslots extends StatefulWidget {
  const Bookedslots({super.key});

  @override
  State<Bookedslots> createState() => _BookedslotsState();
}

class _BookedslotsState extends State<Bookedslots> {
  List Booked_slots = [
    'slot 2', 
    'slot 3', 
    'slot 6',
    'slot 9',
  ];
   List Amount = [
    '500/-', 
    '400/-', 
    '600/-',
    '300/-',
     
  ];
   List Duration = [
    '5 h', 
    '4 h', 
    '6 h',
    '3 h',
     
  ];
  List Date = [
    '2.3.2023', 
    '3.5.2023', 
    '4.3.2023',
    '5.3.2023',
     
  ];
  List Time = [
    '5:00 PM', 
    '4:30 PM', 
    '6:00 PM',
    '11:30 AM',
     
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(  
          title: Center(child: Text('BOOKED SLOTS')),  
        ),  
          body: ListView.builder(
            itemCount: Booked_slots.length,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                child: Column(
                  children: [
                    Text(Booked_slots[position]),
                    Text(Amount[position]),
                    Text(Duration[position]),
                    Text(Date[position]),
                    Text(Time[position]),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: Text('Confirm')),
                          SizedBox(
                            height: 10,
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text('Reject')),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }), 
    );
  }
}