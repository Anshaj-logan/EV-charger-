import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ucomplaint extends StatefulWidget {
  const Ucomplaint({super.key});

  @override
  State<Ucomplaint> createState() => _UcomplaintState();
}

class _UcomplaintState extends State<Ucomplaint> {
  DateTime? _selectDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF3FB95C),
              Color(0xFF3F83B9),
            ], transform: GradientRotation(90)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            'Compliants',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        //decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://www.ssr-inc.com/wp-content/uploads/EV-charging-1082x546.jpg"),fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                    onPressed: () async {
                      final _selectdatetemp = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:
                              DateTime.now().subtract(Duration(days: 30)),
                          lastDate: DateTime.now());
                      if (_selectdatetemp == null) {
                        return;
                      } else {
                        print(_selectdatetemp.toString());
                        setState(() {
                          _selectDate = _selectdatetemp;
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_today),
                    label: Text(_selectDate == null
                        ? 'select date'
                        : _selectDate!.toString())),
                TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: "Complaint",
                    labelText: "Add your complaint",
                    icon: Icon(
                      Icons.view_compact_outlined,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF3FAAB9), Color(0xFF993FB9)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 150, minHeight: 50),
                          alignment: Alignment.center,
                          child: Text(
                            "Submit",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.all(0.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
