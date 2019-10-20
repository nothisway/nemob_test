import 'package:flutter/material.dart';
import 'package:nemob_test/Const/Constant.dart';
import 'package:nemob_test/Models/LoginEntryModel.dart';
import 'package:nemob_test/Models/LoginModel.dart';
import 'package:nemob_test/Screens/CarScreen/car.dart';
import 'package:nemob_test/Services/login_service.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final editTextController = TextEditingController();
  final passwordTextCo = TextEditingController();
  bool loading = false;

  void processLogin() async {
    LoginEntryModel newLoginModel = new LoginEntryModel(
        email: editTextController.text,
        password: passwordTextCo.text
    );
    LoginModel loginModel =
    await login(ENDPOINT_LOGIN, body: newLoginModel.toMap());
    if (loginModel == null) {
      Toast.show("Username atau Password Salah", context);
      setState(() {
        loading = false;
      });
    } else {
      Toast.show('Login Success, Welcome ${loginModel.value[0].DisplayName}', context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Car()));

    }
  }

  Widget loadCircular(){
    if (this.loading == true) {
      return Container(
        height: 50,
        width: 50,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.yellow,
          ),
        ),
      );
    } else {
      return Container(
        height: 50,
        width: 50,
        );
    }
}

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: editTextController,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: passwordTextCo,
        obscureText: true,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
//        onPressed: () async {},
        onPressed: () {
          if (editTextController.text == ''|| passwordTextCo.text == '') {
            Toast.show("Username & Password Shouldn't Empty", context);
          } else {
            setState(() {
              loading = true;
            });
            processLogin();
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.yellow,
        child: Text('Log In', style: TextStyle(color: Colors.grey[800])),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      color: Colors.grey[800],
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Center(child: Image.network('https://nemob.id/Content/image/icon/logo_white.png')),
            ),
            email,
            password,
            loginButton,
            loadCircular()
          ],
        ),
      ),
    );

    return Scaffold(body: body);
  }
}
