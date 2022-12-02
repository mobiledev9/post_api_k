import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:post_api_k/profile_screen.dart';
import 'package:post_api_k/provider/app_satte.dart';
import 'package:post_api_k/provider/classes_screen.dart';
import 'package:post_api_k/provider/students_screen.dart';
import 'package:provider/provider.dart';

import 'det_deta_model.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  TextEditingController SearchController = TextEditingController();

  bool ContainerAniamtion = false;

  List<Getdata?> newsApiData = [];
  List<Getdata?> newsApiData1 = []; 

  // final List items = ["HELLO MAN", "NAMAS STAY", "DIRTY FELLOW"];
  // var Url =
  //     'https://newsapi.org/v2/everything?q=tesla&from=2022-10-08&sortBy=publishedAt&apiKey=28aa00db4ba449e3a6dc189e7f47cbed';
  // var response = await http.get(url);

  bool indicator = false;

  getData() async {
    var url =
        "http://104.248.146.26:3000/api/tutor/getClassById/61c16c82c30aec6d1aaf4d17";
    // res = http.get(Url);
    Response response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    // print("body  ${response.body}");
    // print(data);

    var hindi1 = data['classDetails'];

    for (var element in hindi1) {
      Getdata find = Getdata();
      find = Getdata.fromJson(element);

      setState(() {
        indicator = true;
        newsApiData.add(find);
        newsApiData1.add(find);
      });
      // print(newsApiData);
    }
  }

  /////// Search News /////////

  @override
  void initState() {
    super.initState();
    Provider.of<AppState>(context, listen: false).Tutordetails();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
          child: Consumer<AppState>(builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height) * 0.06,
                      child: Column(
                        children: const [
                          Text(
                            "Course",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue),
                        child: const Image(
                          image: AssetImage('images/image (2).png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.04, left: width * 0.05),
                          child: Container(
                            height: height * 0.11,
                            width: width * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "images/Ketaki-Mategaonkar.jpeg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Row(
                    children: [
                      Text(
                        provider.classlist?.group ?? "kg",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        " Courage Core Course",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Container(
                    height: height * 0.005,
                    width: double.infinity,
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "4 Weeks",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "11 Weeks",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: const Text(
                    "Desecription",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.002),
                  child: const TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                        child: Text("Classes"),
                      ),
                      Tab(
                        child: Text("Students"),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      ApiView(),
                      StudentData(),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
