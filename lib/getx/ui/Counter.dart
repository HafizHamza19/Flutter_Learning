import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/form/ui/InsertDetail.dart';
import 'package:flutterlearn/getx/controller/CounterController.dart';
import 'package:get/get.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  CounterCountroller _counterCountroller = Get.put(CounterCountroller());
  TextEditingController _controller = TextEditingController();
  String _et_value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Impl"),
      ),
      body: Column(
        children: [
          Obx(() {
            return Text("Value :${_counterCountroller.intValue.value}");
            // Text("Value :${_counterCountroller.intValue.value}")
          }),
          TextField(
            controller: _controller,
            onChanged: (String val) {
              _et_value = val;
            },
          ),
          Text(_controller.text),
          Text("Value :${_et_value}")
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => _counterCountroller.increment(),
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => _counterCountroller.decincrement(),
            child: Icon(Icons.minimize),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InsertDetail()),
              );
              print("Controller:" + _controller.text.toString());
              print("VAlue:" + _et_value.toString());
            },
            child: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
