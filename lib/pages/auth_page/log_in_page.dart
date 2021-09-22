import 'dart:convert';
import 'package:anilmastertest/controller/test_controller.dart';
import 'package:anilmastertest/model/log_in_responce.dart';
import 'package:anilmastertest/redux/actions/fetch_action.dart';
import 'package:anilmastertest/redux/store.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:anilmastertest/color_constant.dart';
import 'package:anilmastertest/custom_widget/app_icon.dart';
import 'package:anilmastertest/custom_widget/custom_button.dart';
import 'package:anilmastertest/pages/buttomnav.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _useremail = new TextEditingController();
  final TextEditingController _userpsw = new TextEditingController();
  String? _username, _email, _password = "";
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const AppIconWidget(),
                const SizedBox(
                  height: 40,
                ),
                new TextFormField(
                  controller: _useremail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "e.g abc@gmail.com",
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusColor: Colors.white,
                  ),
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = new RegExp(pattern);
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Username must be @';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _email = value;
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _userpsw,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusColor: Colors.white),
                  textInputAction: TextInputAction.done,
                  validator: (password) {
                    if (password!.isEmpty) {
                      return 'Password is required';
                    } else if (password.length < 6) {
                      return 'Password must be at least 4 characters';
                    }
                    return null;
                  },
                  onSaved: (password) => _password = password!,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                     var res = await TestController().login(
                          email: "eve.holt@reqres.in", password: "cityslicka");

                      if (res != null && res != false) {
                        var loginres = LogInResponce.fromJson(jsonDecode(res));
                        store.dispatch(
                            new AddTokenAction(loginres.token.toString()));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      }
                    } else {
                      print("Error");
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
