

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/loginnew.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                "Login form",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'User Name',
                    prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Container(

              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  prefixIcon: Icon(Icons.vpn_key_sharp),
                ),
              ),
            ),
            FlatButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "click on Forget password");
                },
                textColor: Colors.blue,
                child: Text("Forget password")),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration
                (
                color: Colors.blue,
               borderRadius: BorderRadius.circular(50)
              ),
              child: FlatButton(
                onPressed: () {
                  print(nameController.text.toString());
                  print(passwordController.text.toString());
                  Fluttertoast.showToast(msg: "user : "+nameController.text.toString() +"\n"+"password : "+passwordController.text.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginNew()),
                  );
                  },
               // color: Colors.blue,
                textColor: Colors.white,
                child: Text("Login",
                ),

              ),
            ),
            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Does not have account?"),
                  FlatButton(
                    textColor: Colors.blue,
                      onPressed: () {
                        Fluttertoast.showToast(msg: "click on Sign in");
                      },
                      child: Text('Sign in', style: TextStyle(fontSize: 20)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
