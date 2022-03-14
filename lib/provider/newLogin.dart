import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/localDb/database.dart';
import 'package:flutterlearn/provider/Login.dart';
import 'package:flutterlearn/provider/loginprovider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({Key? key}) : super(key: key);

  @override
  _LoginNewState createState() => _LoginNewState();
}

class _LoginNewState extends State<NewLogin> {
  // late var myProvider;
  final database = DatabaseHelper.instance;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController idForUpdate = TextEditingController();
  TextEditingController idForDelete = TextEditingController();
  late final List<Login> providerData;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Center(
      child: Container(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Consumer<LoginProvider>(
                    builder: (_, loginProvider, __) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            logoShow(),
                            _inputWidget('first Name', firstName),
                            _inputWidget('last Name', lastName),
                            _inputWidget('email', email),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: _button(loginProvider)),
                            _inputWidget('For Update', idForUpdate),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: _buttonUpdate(loginProvider)),
                            _inputWidget('for Delete', idForDelete),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: _delete(loginProvider)),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: _clearAllData(loginProvider)),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: _showWidget(loginProvider)),
                            dataList(loginProvider)
                          ],
                        )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget logoShow() => const Image(
      height: 150, width: 150, image: AssetImage('images/Amp021.png'));

  Widget _inputWidget(String hint, TextEditingController controller) =>
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: hint,
          labelText: hint,
        ),
      );

  Widget _button(LoginProvider loginProvider) => ElevatedButton(
        child: Text("Submit"),
        onPressed: () {
          Login loginModel = Login(
              firstname: firstName.text,
              lastname: lastName.text,
              email: email.text);
          List<Login> login = [loginModel];
          loginProvider.insertIntoDb(login);
          Fluttertoast.showToast(msg: "Success");
          /*  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Counter()),
          );*/
        },
      );

  Widget _buttonUpdate(LoginProvider loginProvider) => ElevatedButton(
        child: const Text("Update"),
        onPressed: () {
          Login loginModel = Login(
              firstname: firstName.text,
              lastname: lastName.text,
              email: email.text);

          List<Login> login = [loginModel];
          loginProvider.updateData(login, idForUpdate);
          Fluttertoast.showToast(msg: "update Success");
        },
      );

  Widget _delete(LoginProvider loginProvider) => ElevatedButton(
        child: const Text("Delete"),
        onPressed: () {
          loginProvider.deleteData(idForDelete);
          Fluttertoast.showToast(msg: "Delete Success");
        },
      );

  Widget _clearAllData(LoginProvider loginProvider) => ElevatedButton(
        child: const Text("Clear All"),
        onPressed: () {
          loginProvider.deleteAllData();
          Fluttertoast.showToast(msg: "Delete Successfully");
        },
      );

  Widget _showWidget(LoginProvider loginProvider) =>
      Text(loginProvider.list.length > 0 ? "Records" : "No Data Available");

  Widget dataList(LoginProvider loginProvider) => Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: loginProvider.list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              shadowColor: Colors.black,
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(loginProvider.list[index].firstname.toString()),
                    Text(loginProvider.list[index].lastname.toString()),
                    Text(loginProvider.list[index].email.toString()),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
