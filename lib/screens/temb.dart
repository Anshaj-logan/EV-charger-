import 'package:flutter/material.dart';
class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
   String dropdownValue = 'Slot 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Row(
              children: [
                Text("AVAILABLE SLOTS:"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                      items: <String>['Slot 1', 'Slot 2', 'Slot 3', 'Slot 4','Slot 5']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 10),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                ),
                 SizedBox(height: 40,width: 20,),
            ElevatedButton(onPressed: (){},child: Text("Add")
            ),
            SizedBox(height: 40,width: 20,),
            ElevatedButton(onPressed: (){},child: Text("Remove")
            ),
              ],
            ),
            Row(
              children: [
                Text("BOOKED SLOTS:"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                      items: <String>['Slot 1', 'Slot 2', 'Slot 3', 'Slot 4','Slot 5']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 10),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                ),
                 SizedBox(height: 40,width: 20,),
            ElevatedButton(onPressed: (){},child: Text("Add")
            ),
            SizedBox(height: 40,width: 20,),
            ElevatedButton(onPressed: (){},child: Text("Remove")
            ),
              ],
            ),
             SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Amount",
                  icon: Icon(Icons.payment,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(height: 40,width: 20,),
            ElevatedButton(onPressed: (){},child: Text("Submit")
            ),
            SizedBox(height: 40,width: 20,),
            ElevatedButton(onPressed: (){},child: Text("Update")
            ),
             ],
            ),
             ],),
          ),
          ),
    );
  }
}