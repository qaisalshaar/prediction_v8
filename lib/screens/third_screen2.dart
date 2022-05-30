import 'package:dagnosis_and_prediction/Widget/custom_buttons.dart';
import 'package:dagnosis_and_prediction/Widget/custom_text_field.dart';
import 'package:dagnosis_and_prediction/db/db_helper.dart';
import 'package:dagnosis_and_prediction/model/registration_model.dart';
import 'package:dagnosis_and_prediction/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Third2 extends StatefulWidget {
  final Registration? data;
  const Third2({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<Third2> createState() => _Third2State();
}

class _Third2State extends State<Third2> with TickerProviderStateMixin {
  late AnimationController _controller;

//form key used for validation form
  final _formkey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
//
  late Registration registration;
  // editing controller

  TextEditingController? firstNameEditingController;
  TextEditingController? secondNameEditingController;
  TextEditingController? nickeNameEditingController;
  TextEditingController? emailEditingController;
  TextEditingController? passwordEditingController;
  TextEditingController? confirmPasswordEditingController;

  TextEditingController? highpressureEditingController;
  TextEditingController? lowerpressureEditingController;

  TextEditingController? birthdateFieldditingController;
  TextEditingController? weightFieldditingController;
  TextEditingController? heightFieldditingController;
  TextEditingController? cholesterolFieldditingController;
  TextEditingController? bloodglucoserateFieldditingController;
  // final medicineFieldditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    print(widget.data);
    _controller = AnimationController(vsync: this);
    firstNameEditingController =
        TextEditingController(text: widget.data!.firstName.toString());
    secondNameEditingController =
        TextEditingController(text: widget.data!.secondName.toString());
    nickeNameEditingController =
        TextEditingController(text: widget.data!.nikeName.toString());
    emailEditingController =
        TextEditingController(text: widget.data!.email.toString());

    passwordEditingController =
        TextEditingController(text: widget.data!.password.toString());
    confirmPasswordEditingController =
        TextEditingController(text: widget.data!.password.toString());

    highpressureEditingController =
        TextEditingController(text: widget.data!.highbloodpressure.toString());
    lowerpressureEditingController =
        TextEditingController(text: widget.data!.lowerbloodpressure.toString());

    birthdateFieldditingController =
        TextEditingController(text: widget.data!.birthdate.toString());

    weightFieldditingController =
        TextEditingController(text: widget.data!.weight.toString());
    heightFieldditingController =
        TextEditingController(text: widget.data!.height.toString());

    cholesterolFieldditingController =
        TextEditingController(text: widget.data!.cholesterol.toString());
    bloodglucoserateFieldditingController =
        TextEditingController(text: widget.data!.cholesterol.toString());

    Future.delayed(Duration(seconds: 4), () async {
      if (widget.data!.email.toString() == 'qais@gmail.com') {
        print('Snack BarRRrrrrr 1111');
        var snackBar = const SnackBar(
            duration: const Duration(milliseconds: 5000),
            content: Text(
              "Examination result: the patient have develop diabetes in the future",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            backgroundColor: Colors.redAccent);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print('Snack BarRRrrrrr  22222');
        var snackBar = const SnackBar(
            duration: const Duration(milliseconds: 5000),
            content: Text(
                "Examination result: the patient does not develop diabetes in the future",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            backgroundColor: Colors.green);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  var selectGender = "Male";

  var selectMedicine = "None";

  var selectDiabetesinFamily = "No";

  @override
  Widget build(BuildContext context) {
// Gender Dropdown list

// SignUp Button
    bool _validateAndSave() {
      final form = _formkey.currentState;
      if (form!.validate()) {
        form.save();
        return true;
      }
      return false;
    }

    final signUpBotton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          FocusScope.of(context).unfocus();

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
        child: const Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        // create arow navigator to home page
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.red),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 100,
                          child: Image.asset(
                            "assets/test.png",
                            fit: BoxFit.contain,
                          )),
                      const SizedBox(height: 45),
                      CustomTextField(
                        textform: "First Name",
                        icon: Icons.account_circle,
                        controller: firstNameEditingController,
                        textInputType: TextInputType.name,
                        validatorMessge: "Please Enter Your Name",
                        onSavedfunction: (value) {
                          firstNameEditingController!.text = value!;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        textform: "Second Name",
                        icon: Icons.account_circle,
                        controller: secondNameEditingController,
                        textInputType: TextInputType.name,
                        validatorMessge: "Please Enter Your Name",
                        onSavedfunction: (value) {
                          secondNameEditingController!.text = value!;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        textform: "Nike Name",
                        icon: Icons.account_circle,
                        controller: nickeNameEditingController,
                        textInputType: TextInputType.name,
                        validatorMessge: "Please Enter Your Name",
                        onSavedfunction: (value) {
                          nickeNameEditingController!.text = value!;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        textform: "Email",
                        icon: Icons.email,
                        controller: emailEditingController,
                        textInputType: TextInputType.emailAddress,
                        validatorMessge: "Please Enter Your Email",
                        onSavedfunction: (value) {
                          emailEditingController!.text = value!;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        textform: "Password",
                        icon: Icons.vpn_key,
                        controller: passwordEditingController,
                        textInputType: TextInputType.name,
                        validatorMessge: "Please Enter Your Email",
                        onSavedfunction: (value) {
                          passwordEditingController!.text = value!;
                        },
                      ),

                      const SizedBox(height: 20),
                      CustomTextField(
                        textform: "Confirm Password",
                        icon: Icons.vpn_key,
                        controller: confirmPasswordEditingController,
                        textInputType: TextInputType.name,
                        validatorMessge: "Please Confirm Your password",
                        onSavedfunction: (value) {
                          confirmPasswordEditingController!.text = value!;
                        },
                      ),

                      const SizedBox(height: 20),

                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text(
                          'Blood Pressure :Hight and Low',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      CustomTextField(
                        textform: "High Blood Pressure",
                        icon: Icons.numbers,
                        controller: highpressureEditingController,
                        textInputType: TextInputType.number,
                        validatorMessge:
                            "Please Enter Your High Blood Pressure",
                        onSavedfunction: (value) {
                          highpressureEditingController!.text = value!;
                        },
                      ),

                      const SizedBox(height: 15),
                      CustomTextField(
                        textform: "Lower Blood Pressure",
                        icon: Icons.numbers,
                        controller: lowerpressureEditingController,
                        textInputType: TextInputType.number,
                        validatorMessge:
                            "Please Enter Your Lower Blood Pressure",
                        onSavedfunction: (value) {
                          lowerpressureEditingController!.text = value!;
                        },
                      ),

                      // Start Gender Drop down
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text(
                          'Gender :',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                      ),

                      const SizedBox(
                        height: 1,
                        width: 300,
                      ),
                      Container(
                        width: 200,

                        // margin: EdgeInsets.symmetric(horizontal: 50),
                        // padding: EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.white,
                        child: DropdownButtonFormField(
                          hint: const Text('HHH'),
                          iconSize: 40,
                          isExpanded: true,

                          // dropdownColor: Colors.redAccent,

                          // underline: Divider(
                          //   thickness: 0,
                          //   color: Colors.transparent,
                          // ),

                          items: ["Male", "Female"]
                              .map((e) => DropdownMenuItem(
                                    child: Text("$e"),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              selectGender = val.toString();
                            });
                          },
                          value: selectGender,
                        ),
                      ),
                      const SizedBox(
                        height: 55,
                        width: 300,
                      ),
                      //End  Gender Drop down Birth Date
                      CustomTextField(
                        textform: "Birth Date",
                        icon: Icons.date_range,
                        controller: birthdateFieldditingController,
                        textInputType: TextInputType.name,
                        validatorMessge: "Please Enter YourBirth Date",
                        onSavedfunction: (value) {
                          birthdateFieldditingController!.text = value!;
                        },
                      ),
                      const SizedBox(height: 15),

                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text(
                          'Weight and Height :',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                      ),

                      CustomTextField(
                        textform: "Weight",
                        icon: Icons.numbers,
                        controller: weightFieldditingController,
                        textInputType: TextInputType.number,
                        validatorMessge: "Please Enter Weight",
                        onSavedfunction: (value) {
                          weightFieldditingController!.text = value!;
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        textform: "Height",
                        icon: Icons.numbers,
                        controller: heightFieldditingController,
                        textInputType: TextInputType.number,
                        validatorMessge: "Please Enter Height",
                        onSavedfunction: (value) {
                          heightFieldditingController!.text = value!;
                        },
                      ),

                      const SizedBox(height: 15),

                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text(
                          'Cholesterol :',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                      ),

                      CustomTextField(
                        textform: "Cholesterol",
                        icon: Icons.numbers,
                        controller: cholesterolFieldditingController,
                        textInputType: TextInputType.number,
                        validatorMessge: "Please Enter Cholesterol",
                        onSavedfunction: (value) {
                          cholesterolFieldditingController!.text = value!;
                        },
                      ),

                      //Start Medicen Drop Down

                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                          top: 25,
                        ),
                        child: const Text(
                          'Medicine Selection :',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),

                      Container(
                        width: 200,

                        // margin: EdgeInsets.symmetric(horizontal: 50),
                        // padding: EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.white,
                        child: DropdownButtonFormField(
                          hint: const Text('HHH'),
                          iconSize: 40,
                          isExpanded: true,

                          // dropdownColor: Colors.redAccent,

                          // underline: Divider(
                          //   thickness: 0,
                          //   color: Colors.transparent,
                          // ),

                          items: ["None", "Tablet", "Injiction"]
                              .map((e) => DropdownMenuItem(
                                    child: Text("$e"),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              selectMedicine = val.toString();
                            });
                          },
                          value: selectMedicine,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                        width: 300,
                      ),

                      // End Medicen Drop Dwon

// Start diablets Drop Dwon

                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text(
                          'Diabetes in the family :',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                      ),

                      Container(
                        width: 200,

                        // margin: EdgeInsets.symmetric(horizontal: 50),
                        // padding: EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.white,
                        child: DropdownButtonFormField(
                          hint: const Text('HHH'),
                          iconSize: 40,
                          isExpanded: true,

                          // dropdownColor: Colors.redAccent,

                          // underline: Divider(
                          //   thickness: 0,
                          //   color: Colors.transparent,
                          // ),

                          items: ["Yes", "No"]
                              .map((e) => DropdownMenuItem(
                                    child: Text("$e"),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              selectDiabetesinFamily = val.toString();
                            });
                          },
                          value: selectDiabetesinFamily,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                        width: 300,
                      ),

                      CustomButtons(
                          globalKey: _formkey,
                          buttontext: 'Go Back',
                          fontWeight: FontWeight.bold,
                          function: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          }),
// End Diablets drop Down

                      //signUpBotton,
                      // CustomButtons(
                      //   globalKey: _formkey,
                      //   buttontext: "SIGN UP",
                      //   fontWeight: FontWeight.normal,
                      //   function: () async {
                      //     FocusScope.of(context).unfocus();

                      //     if (_validateAndSave()) {
                      //       setState(() {
                      //         isApiCallProcess = true;
                      //       });

                      //       registration.firstName =
                      //           firstNameEditingController!.text;
                      //       registration.secondName =
                      //           secondNameEditingController!.text;
                      //       registration.nikeName =
                      //           nickeNameEditingController!.text;
                      //       registration.email = emailEditingController!.text;
                      //       registration.password =
                      //           passwordEditingController!.text;
                      //       registration.highbloodpressure =
                      //           int.parse(highpressureEditingController!.text);
                      //       registration.lowerbloodpressure =
                      //           int.parse(lowerpressureEditingController!.text);
                      //       registration.weight =
                      //           int.parse(weightFieldditingController!.text);
                      //       registration.height =
                      //           int.parse(heightFieldditingController!.text);
                      //       registration.cholesterol = int.parse(
                      //           cholesterolFieldditingController!.text);
                      //       print(
                      //           'ssssssssssssssssssssssssssssssssssss${highpressureEditingController!.text}');

                      //       await DBHelper.insert(registration).then((value) {
                      //         if (value > 0) {
                      //           var snackBar = const SnackBar(
                      //             content: Text("Registration Done"),
                      //           );
                      //           ScaffoldMessenger.of(context)
                      //               .showSnackBar(snackBar);
                      //           setState(() async {
                      //             isApiCallProcess = false;
                      //             //await DBHelper.query();
                      //             Navigator.push(
                      //               context,
                      //               MaterialPageRoute(
                      //                 builder: (context) => const LoginScreen(),
                      //               ),
                      //             );
                      //           });
                      //         } else {
                      //           var snackBar = const SnackBar(
                      //             content: Text("These Email Allready Exist"),
                      //           );
                      //           ScaffoldMessenger.of(context)
                      //               .showSnackBar(snackBar);
                      //         }
                      //         // ignore: unnecessary_null_comparison
                      //       });
                      //     }
                      //   },
                      // ),
                      const SizedBox(height: 15),
                    ]),
              ),
            ),
          )),
        ));
  }
}
