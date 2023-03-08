import 'package:flutter/material.dart';
import 'addslots.dart';

class Availableslots extends StatefulWidget {
  const Availableslots({super.key});

  @override
  State<Availableslots> createState() => _AvailableslotsState();
}

class _AvailableslotsState extends State<Availableslots> {
  List Available_slots = [
    'slot 1',
    'slot 4',
    'slot 5',
    'slot 7',
    'slot 8',
    'slot 10',
  ];
  List Amount = [
    '100/- per hour',
    '100/- per hour',
    '100/- per hour',
    '100/- per hour',
    '100/- per hour',
    '100/- per hour',
  ];
  List Duration = [
    'max 6 h',
    'max 4 h',
    'max 6 h',
    ' max 3 h',
    'max 4 h',
    'max 6 h',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CHARGING STATIONS')),
      ),
      body: ListView.builder(
          itemCount: Available_slots.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              child: Column(
                children: [
                  Text(Available_slots[position]),
                  Text(Amount[position]),
                  Text(Duration[position]),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(onPressed: () {}, child: Text('Update')),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        ElevatedButton(onPressed: () {}, child: Text('Delete')),
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Addslots()));
          setState(() {});
        },
      ),
    );
  }
}
