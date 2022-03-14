import 'package:flutter/cupertino.dart';
import 'package:flutterlearn/localDb/database.dart';
import 'package:flutterlearn/provider/Login.dart';

class LoginProvider extends ChangeNotifier {
  List<Login> list = <Login>[];

  LoginProvider() {
    getdata();
  }

  getdata() async {
    list.clear();
    list.addAll(await DatabaseHelper.getdata());
    for (int i = 0; i < list.length; i++) {
      print(
          '$i first name ${list[i].firstname}  lastname : ${list[i].lastname} email : ${list[i].email}');
    }
    notifyListeners();
  }

  insertIntoDb(List<Login> login) async {
    await DatabaseHelper.insertData(login);
    getdata();
  }

  updateData(List<Login> login, TextEditingController idForUpdate) async {
    int i = await DatabaseHelper.updateData(
        login, int.parse(idForUpdate.text.toString()));
    print('update $i');
    getdata();
  }

  deleteData(TextEditingController idForDelete) async {
    int i = await DatabaseHelper.deleteRecord(
        int.parse(idForDelete.text.toString()));
    print('delete $i');
    getdata();
  }

  deleteAllData() async {
    await DatabaseHelper.dropTable();
    getdata();
  }
}
