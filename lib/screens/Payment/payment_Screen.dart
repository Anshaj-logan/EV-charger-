import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newpro/screens/Payment/payment_success.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class Payment extends StatefulWidget {
  late String amount;
  Payment(this.amount);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late SharedPreferences localStorage;
  String amount = "";
  late String login_id;

  List _loadbooklist = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    localStorage = await SharedPreferences.getInstance();
    String Login_id = (localStorage.getString('loginId') ?? '');
    print('login id ${Login_id}');
    var res = await Api().getData('/api/charging/booked-single-slots-user/' +
        Login_id.replaceAll('"', ''));

    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loadbooklist = items[items.length - 1]['_id'];
      });
    } else {
      setState(() {
        _loadbooklist = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Row(
          children: [
            Text(
              'Payment',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ArchivoBlack'),
            ),
            SizedBox(width: 10),
            Container(
              height: 38,
              width: 1,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Web',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  'Self Services',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
              child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue[600]),
                child: Center(
                  child: Text(
                    'Slot Payment',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ArchivoBlack',
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        border: Border.all(color: Colors.black54, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Payment Details',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.black54, width: 1)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Text(
                                'Slot Amount',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              SizedBox(width: 120),
                              Text(
                                widget.amount,
                                style: TextStyle(
                                    color: Colors.deepOrange, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.black54, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Text(
                                'Total Payable Amount',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              SizedBox(width: 30),
                              Text(
                                widget.amount,
                                style: TextStyle(
                                    color: Colors.deepOrange, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.black54, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Text(
                                'PG Charge',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              SizedBox(width: 130),
                              Text(
                                '₹ 0.00',
                                style: TextStyle(
                                    color: Colors.deepOrange, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Card(
                color: Colors.orange[600],
                child: Column(
                  children: [
                    RadioListTile(
                        title: Text(
                          'Credit Card',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        value: 'credit',
                        groupValue: payment,
                        onChanged: (value) {
                          setState(() {
                            payment = value.toString();
                          });
                        }),
                    RadioListTile(
                        title: Text(
                          'Debit Card',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        value: 'debit',
                        groupValue: payment,
                        onChanged: (value) {
                          setState(() {
                            payment = value.toString();
                          });
                        }),
                    RadioListTile(
                        title: Text(
                          'UPI',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        value: 'upi',
                        groupValue: payment,
                        onChanged: (value) {
                          setState(() {
                            payment = value.toString();
                          });
                        }),
                    RadioListTile(
                        title: Text(
                          'Net Banking',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        value: 'netBanking',
                        groupValue: payment,
                        onChanged: (value) {
                          setState(() {
                            payment = value.toString();
                          });
                        }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 4, left: 4),
              child: Container(
                height: 45,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue[600]),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentSuccess(),
                        ));
                  },
                  child: Text(
                    'PAY',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String? payment;
}
