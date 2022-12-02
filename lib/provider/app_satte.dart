// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:async';

// import 'package:code_with_patel/model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:post_api_k/provider/model.dart';
import 'package:post_api_k/provider/utils.dart';

import '../home-screen.dart';

class AppState extends ChangeNotifier {
  int temp = 30;

  void updateTemp(int temp) {
    this.temp = temp;
    notifyListeners();
  }

  //Timer function
  int start = 0;

  void updateStart(int start) {
    this.start = start;
    notifyListeners();
  }

  void getTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateStart(timer.tick);
    });
  }

//Provider with Async
  String name = "Code with Patel";

  void updateName(String name) {
    this.name = name;
    notifyListeners();
  }

  Future<void> getName(String name) async {
    Future.delayed(Duration(seconds: 5), () {
      updateName(name);
    });
  }

  //Change the Widget
  bool change = false;

  void updateWidget() {
    change = !change;
    notifyListeners();
  }

  ///Provider working with Rest Api
  bool loader = true;
  // List<Article> listdata = [];
  ClassDetails? classlist;

  Future<void> Tutordetails() async {
    loader = false;
    Tutormodel model = await Apiservice().Tutordata();
    classlist = model.classDetails;
    loader = true;
    notifyListeners();
  }

  // bool loader1 = true;
  // // List<Article> listdata = [];
  // ClassDetails? classlist1;

  // Future<void> Tutordetails1() async {
  //   loader1 = false;
  //   Tutormodel model = await login();
  //   classlist1 = model.user;
  //   loader1 = true;
  //   notifyListeners();
  // }
}

class loginPro with ChangeNotifier {
  bool _lodingProvider = false;
  bool get loding => _lodingProvider;
  setLoading(bool value) {
    _lodingProvider = value;
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    setLoading(true);
    try {
      Response response = await post(
          Uri.parse("http://104.248.146.26:3000/api/auth/loginStudent"),
          body: {"studentId": email, "password": password});
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login successful")));
        // print('successfully logged');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeSceen(),
            ),
            (route) => false);
        setLoading(false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("invelid user id and Password")));
        print('login failed');
        setLoading(false);
      }
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}
