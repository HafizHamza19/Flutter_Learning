import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/provider/newLogin.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginNew extends StatefulWidget {
  const LoginNew({Key? key}) : super(key: key);

  @override
  _LoginNewState createState() => _LoginNewState();
}

class _LoginNewState extends State<LoginNew> {
  late TextEditingController et1Controller = TextEditingController();
  TextEditingController et2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login new"),
        ),
        body: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            /*  physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),*/
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [text1(), edt1(), edt2(), button()],
            ),
          ),
        ));
  }

  Widget text1() => Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
      );

  Widget edt1() => Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextField(
        controller: et1Controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "User name",
            focusColor: Colors.blue),
      ));

  Widget edt2() => Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextField(
        controller: et2Controller,
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Password",
            focusColor: Colors.blue),
      ));

  Widget button() => Container(
      padding: EdgeInsets.all(20),
      child: FloatingActionButton(
          onPressed: () {
            if (et1Controller.text.toString().isEmpty ||
                et2Controller.text.toString().isEmpty) {
              Fluttertoast.showToast(
                  msg: "Please insert Username and password");
            } else {
              Fluttertoast.showToast(
                  msg: "Success\n Name :" +
                      et1Controller.text.toString() +
                      "\n Password :" +
                      et2Controller.text.toString());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewLogin()),
              );
            }
          },
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue));
}
