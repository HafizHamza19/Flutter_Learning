import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class newUi extends StatelessWidget {
  // const ({Key? key}) : super(key: key);
  TextEditingController id = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
            child: Builder(
                builder: (context) => Center(
                        child: Container(
                      child: SingleChildScrollView(
                        /*  physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),*/
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 400,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('images/background.png'),
                                      fit: BoxFit.fill)),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      left: 30,
                                      width: 80,
                                      height: 150,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'images/light-1.png'))))),
                                  Positioned(
                                      left: 140,
                                      width: 80,
                                      height: 125,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'images/light-2.png'))))),
                                  Positioned(
                                      right: 40,
                                      top: 40,
                                      width: 80,
                                      height: 125,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'images/clock.png'))))),
                                  Positioned(
                                      child: Container(
                                    margin: EdgeInsets.only(top: 50),
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(30),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  143, 148, 251, 1.0),
                                              blurRadius: 20.0,
                                              offset: Offset(0, 10))
                                        ]),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey))),
                                          child: TextField(
                                            controller: id,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter Email",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400])),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey))),
                                          child: TextField(
                                            controller: password,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Password",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400])),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        if (id.text.toString().isNotEmpty &&
                                            password.text
                                                .toString()
                                                .isNotEmpty) {
                                          final progress =
                                              ProgressHUD.of(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyApp()));
                                          progress!.showWithText('Loading...');
                                          progress.show();
                                          authenticateUser(
                                              id.text.toString(),
                                              password.text.toString(),
                                              context);
                                        } else {
                                          _showDialog(
                                              "Alert",
                                              "Please Enter UserId and Password",
                                              context);
                                        }
                                      },
                                      child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(colors: [
                                                Color.fromRGBO(
                                                    143, 148, 251, 1),
                                                Color.fromRGBO(143, 148, 251, 6)
                                              ])),
                                          child: Center(
                                              child: Text("Login",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)))))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )))));
  }

  //String _baseUrl = "API";
  String _baseUrl = "API";

  Future authenticateUser(
      String username, String password, BuildContext context) async {
    final progress = ProgressHUD.of(context);

    try {
      final response =
          await http.post(Uri.parse('${_baseUrl}Login/UserLogin'), body: {
        'UserName': username,
        'Password': password,
      });

      switch (response.statusCode) {
        case 200:
          print('200 : ${response.body}');
          progress!.dismiss();

          final body = json.decode(response.body);
          if (body['IsSuccess'] == true &&
              body['Message'] == "Login Successfull") {
            var data = body["Data"];
            print(data[0]['UserName']);
            print(data[0]['UserRole']);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          }
          Fluttertoast.showToast(msg: '${body['Message']}');

          break;
        case 401:
          print('401 : ${response.body}');
          Fluttertoast.showToast(msg: response.body);
          progress!.dismiss();

          break;
        default:
          print('error : ${response.body}');
          Fluttertoast.showToast(msg: response.body);
          progress!.dismiss();

          break;
      }
    } on SocketException {
      print('server error');
      Fluttertoast.showToast(msg: 'server error');
      progress!.dismiss();
    }
  }

  void _showDialog(String title, String msg, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          title: new Text(title, textAlign: TextAlign.center),
          content: new Text(msg, textAlign: TextAlign.center),
          actions: <Widget>[
            new FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.indigo,
              textColor: Colors.white,
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
