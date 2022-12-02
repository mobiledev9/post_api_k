import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_api_k/key.dart';

import 'my_pass_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController datapass = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                height: height * 0.25,
                width: double.infinity,
                child: SvgPicture.asset(
                  "images/Frame 40.svg",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 165),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset("images/Logo (1).svg",
                          height: height * 0.12),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.07,
              right: width * 0.07,
            ),
            child: Form(
              key: usearkey,
              child: TextFormField(
                validator: (i) {
                  if (i == "" || i == null) {
                    return 'Enter tha User id!';
                  }
                },
                controller: datapass,
                autofocus: true,
                // obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User ID',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.07,
                right: width * 0.07,
                bottom: height * 0.015),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (usearkey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyPassScreen(datapass.text)));
                  }
                });

                // print(datapass.text);
              },
              child: Container(
                height: 60,
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
            ),
          ),
        ],
      ),
    );
  }
}
