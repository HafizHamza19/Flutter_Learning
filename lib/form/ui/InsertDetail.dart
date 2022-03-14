import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../getxImplementation/ui/ShoppingUi.dart';

class InsertDetail extends StatelessWidget {
  //const InsertDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      alignment: Alignment.center,
      child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Card(
            margin: EdgeInsets.all(20),
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Card(
                  color: Colors.blue[50],
                  elevation: 20,
                  child: Container(
                    alignment: Alignment.center,
                    height: 64,
                    width: 200,
                    child: Text("Title",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                        textAlign: TextAlign.center),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                for (int i = 0; i < 10; i++) editText('Label $i'),
                Button1(context)
              ],
            ),
          )),
    );
  }

  Widget editText(String lable) => Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: lable,
            prefixIcon: Icon(Icons.person),
          ),
        ),
      );

  Widget Button1(BuildContext context) => ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShoppingUi()),
          );
        },
        child: Text(
          "Submit",
        ),
      );

  Widget Button(BuildContext context) => FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShoppingUi()),
          );
        },
        child: Icon(
          Icons.send,
          color: Colors.white,
        ),
      );
}
