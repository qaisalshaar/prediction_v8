import 'package:dagnosis_and_prediction/screens/home_screen.dart';
import 'package:dagnosis_and_prediction/screens/showresult.dart';
import 'package:dagnosis_and_prediction/screens/tableresualt.dart';
import 'package:dagnosis_and_prediction/screens/tableresualtfa.dart';
import 'package:dagnosis_and_prediction/screens/tableresualto.dart';
import 'package:dagnosis_and_prediction/screens/tableresualtq.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const UsresScreen());

class UsresScreen extends StatelessWidget {
  const UsresScreen({Key? key}) : super(key: key);

  // sampleFunction() {
  //   print('Function Called');
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            // Navigator.of(context).pop();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: [
              const SizedBox(height: 55),
              Column(
                children: [
                  SizedBox(
                      height: 100,
                      child: Image.asset(
                        "assets/test.png",
                        fit: BoxFit.contain,
                      )),
                ],
              ),
              const SizedBox(height: 55),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'Administrator Page :',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 50, right: 50),
                width: 350.00,
                child: const TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.search_sharp, color: Colors.redAccent),
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white60,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.red, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                ),
              ),

              // seacrhField,
              const SizedBox(height: 45),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.redAccent,
                          child: MaterialButton(
                            // padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            // minWidth: MediaQuery.of(context).size.width,

                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TableResualtq()));
                            },
                            child: const Text(
                              "qais alshaar",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.redAccent,
                          child: MaterialButton(
                            // padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            // minWidth: MediaQuery.of(context).size.width,

                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TableResualt()));
                            },
                            child: const Text(
                              "Ahmmed Saaed",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green,
                          child: MaterialButton(
                            // padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            // minWidth: MediaQuery.of(context).size.width,
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TableResualto()));
                            },
                            child: const Text(
                              "Omar Aziz",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        padding: const EdgeInsets.fromLTRB(35, 10, 10, 10),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green,
                          child: MaterialButton(
                            // padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            // minWidth: MediaQuery.of(context).size.width,

                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TableResualtFA()));
                            },
                            child: const Text(
                              "Fatma ahmed",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
      )),
    ));
  }
}
