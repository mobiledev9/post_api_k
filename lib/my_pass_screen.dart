// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_api_k/key.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:post_api_k/provider/app_satte.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_model.dart';
import 'home-screen.dart';

class MyPassScreen extends StatefulWidget {
  // const MyPassScreen({super.key});
  String idpass;
  MyPassScreen(this.idpass);

  @override
  State<MyPassScreen> createState() => _MyPassScreenState();
}

class _MyPassScreenState extends State<MyPassScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      userid.text = widget.idpass;
    });
    print(userid.text);
  }

  bool showpass = false;
  TextEditingController userid = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final singpro = Provider.of<loginPro>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              SizedBox(
                height: height * 0.20,
                width: double.infinity,
                child: SvgPicture.asset(
                  "images/Frame 40.svg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: height * 0.20,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        Text(
                          "Log In",
                          style: GoogleFonts.barlow(fontSize: 18),
                        ),
                        const Text("                "),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset("images/Logo (1).svg",
                          height: height * 0.12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.07,
                  right: width * 0.07,
                ),
                child: Form(
                  key: formkey,
                  child: TextFormField(
                    controller: userid,
                    validator: (id) {
                      if (id == " " || id == null) {
                        return 'Enter the User Id!';
                      }
                    },
                    autofocus: true,
                    // obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'User ID',
                      labelStyle: GoogleFonts.barlow(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.07,
                  right: width * 0.07,
                ),
                child: Form(
                  key: passkey,
                  child: TextFormField(
                    controller: password,
                    validator: (pass) {
                      if (pass == "" || pass == null) {
                        return 'Enter tha password!';
                      }
                    },
                    autofocus: true,
                    obscureText: !showpass,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: GoogleFonts.barlow(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showpass = !showpass;
                          });
                        },
                        icon: showpass
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.07,
                right: width * 0.07,
                bottom: height * 0.015),
            child: InkWell(
              onTap: () {
                if (passkey.currentState!.validate())
                  singpro.login(userid.text.toString(),
                      password.text.toString(), context);
              },
              child: Column(
                children: [
                  Container(
                    height: height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log In",
                          style: GoogleFonts.barlow(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: GoogleFonts.barlow(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> login() async {
  //   SharedPreferences kuldip = await SharedPreferences.getInstance();
  //   if (password.text.isNotEmpty && userid.text.isNotEmpty) {
  //     var response = await http.post(
  //         Uri.parse("http://104.248.146.26:3000/api/auth/loginStudent"),
  //         body: ({
  //           'studentId': userid.text,
  //           'password': password.text,
  //         }));
  //     var result = jsonDecode(response.body);
  //     LoginApiResponse loginmodel = LoginApiResponse.fromJson(result);

  //     // print('object ${loginmodel.user!.loginToken}');

  //     kuldip.setString('logintokan', '${loginmodel.user!.loginToken}');

  //     // print("tokan ${tokan}");

  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text("Login successful")));
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(builder: (context) => HomeSceen()),
  //           (route) => false);
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("invelid user id and Password")));
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("data"),
  //     ));
  //   }
  // }
}
