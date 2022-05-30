import 'package:dagnosis_and_prediction/Widget/custom_buttons.dart';
import 'package:dagnosis_and_prediction/screens/current_location.dart';
import 'package:dagnosis_and_prediction/screens/location_screen.dart';
import 'package:dagnosis_and_prediction/screens/locationtest.dart';
import 'package:dagnosis_and_prediction/screens/login_screen.dart';
import 'package:dagnosis_and_prediction/screens/users_screen.dart';
import 'package:flutter/material.dart';
// import 'package:horizontal_data_table/horizontal_data_table.dart';

void main() {
  runApp(UserCasseScreen());
}

class UserCasseScreen extends StatefulWidget {
  @override
  _TableExample createState() => _TableExample();
}

class _TableExample extends State<UserCasseScreen> {
  @override
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Diabetes Reading By Days'),
        ),
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Center(
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
                              'ahmed saeed',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
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
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Start Insert List View Horisontal List
            Container(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => TableContent(),
                separatorBuilder: (context, index) => SizedBox(
                  width: 20,
                ),
                itemCount: 1,
              ),
            ),

            const SizedBox(
              height: 30,
              width: 300,
            ),

            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyCurrentLocation()),
                  );
                },
                icon: Icon(
                    Icons.add_location_rounded), //icon data for elevated button
                label: Text("Find Patient Location"), //label text
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 68, 255, 93) //elevated btton background color
                    )),
            SizedBox(
              height: 20,
            ),

            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UsresScreen()),
                  );
                },
                icon: Icon(
                    Icons.assignment_return), //icon data for elevated button
                label: Text("Go Back"), //label text
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 255, 68, 68) //elevated btton background color
                    )),
          ],
        ),
      ),
    );
  }
}

Widget TableContent() => // start messenger horisental list

    Center(
        child: Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(20),
        child: Table(
          defaultColumnWidth: FixedColumnWidth(110.0),
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
                Text('Glucose Rate',
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
                Text('Diet Food',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
              ]),
              Column(children: [
                Text('Medicine',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ))
              ]),
              Column(children: [
                Text('Action',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ))
              ]),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('10/10/2021')]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('200')]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('125')]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('Diet Food')]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('Medicen')]),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
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
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('10/10/2021')]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('200')]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('125')]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('Diet Food')]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('Medicen')]),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
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
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('10/10/2021')]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('100')]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('125')]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('Diet Food')]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [Text('Medicen')]),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
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
    ]));
