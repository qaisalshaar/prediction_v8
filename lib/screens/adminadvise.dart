// My Project

import 'dart:developer';

import 'package:dagnosis_and_prediction/Widget/custom_buttons.dart';
import 'package:dagnosis_and_prediction/screens/users_screen.dart';
import 'package:flutter/material.dart';

import 'package:parent_child_checkbox/parent_child_checkbox.dart';

void main() {
  runApp(AdminAdvise());
}

final TextEditingController medicenController = TextEditingController();

class AdminAdvise extends StatefulWidget {
  @override
  _TableExample createState() => _TableExample();
}

class _TableExample extends State<AdminAdvise> {
  @override
  final _formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Diabetes Reading By Days'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Patient Name : ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Ahmed Saeed',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Gender : ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Male',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Table(
                //  defaultColumnWidth: FixedColumnWidth(90.0),
                columnWidths: {
                  0: FlexColumnWidth(5),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(5),
                  3: FlexColumnWidth(4),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Text('Days',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ))
                    ]),
                    Column(children: [
                      Text('Glucose',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ))
                    ]),
                    Column(children: [
                      Text('Cholesterol',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ))
                    ]),
                    Column(children: [
                      Text('Actions',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ))
                    ]),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(children: [Text('10/10/2010')]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(children: [Text('260')]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(children: [Text('150')]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(children: [
                        Text('Emergency Situation',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red))
                      ]),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(children: [Text('12/10/2010')]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(children: [Text('280')]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(children: [Text('123')]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(children: [
                        Text('Emergency Situation',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red))
                      ]),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(children: [Text('20/10/2010')]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(children: [Text('140')]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(children: [Text('122')]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(children: [
                        Text('Normal',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent))
                      ]),
                    ),
                  ]),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Doctor Advise : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ParentChildCheckbox(
                  parent: Text('Advise'),
                  children: [
                    Text('Diet Food'),
                    Text('Medicine'),
                  ],
                  parentCheckboxColor: Color.fromARGB(255, 43, 0, 255),
                  childrenCheckboxColor: Colors.red,
                ),
                Container(
                  width: 200,
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: medicenController,
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.edit),
                          labelText: 'Doctor Advise')),
                ),
                ElevatedButton(
                  child: Text('Save'),
                  onPressed: () {
                    log(ParentChildCheckbox.isParentSelected.toString());
                    log(ParentChildCheckbox.selectedChildrens.toString());
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            CustomButtons(
                globalKey: _formkey,
                buttontext: 'Go Back',
                fontWeight: FontWeight.bold,
                function: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => UsresScreen()));
                }),
          ]),
        ),
      ),
    );
  }
}
