import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_api_k/provider/model.dart';
import 'package:post_api_k/provider/utils.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'app_satte.dart';

class ApiView extends StatefulWidget {
  const ApiView({Key? key}) : super(key: key);

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  List ColorsIndex = [
    Colors.blue,
    // Colors.blue,
    // Colors.blue,
  ];
  List LightsIndex = [
    Color.fromARGB(255, 197, 230, 198),
    Colors.yellow[100],
    Colors.orange[100],
    Colors.red[100],
    Colors.pink[100],
  ];
  @override
  void initState() {
    Provider.of<AppState>(context, listen: false).Tutordetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AppState>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<AppState>(
        builder: (context, provider, child) {
          return (provider.loader
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.classlist?.timetable.length,
                  itemBuilder: (BuildContext context, int inde) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: height * 0.0002),
                          child: Text(
                            provider.classlist?.timetable[inde].date ??
                                "kuldip",
                            style: GoogleFonts.lato(fontSize: 15),
                          ),
                        ),
                        Column(
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: provider
                                  .classlist?.timetable[inde].schedule.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 22),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: width * 0.045),
                                        height: height * 0.1,
                                        decoration: BoxDecoration(
                                          color: ColorsIndex[
                                              inde % ColorsIndex.length],
                                          //  inde == 0
                                          //     ? ColorsIndex[Random().nextInt(3)]
                                          //     : inde == 1
                                          //         ? ColorsIndex[1]
                                          //         : inde == 2
                                          //             ? ColorsIndex[2]
                                          //             : inde == 3
                                          //                 ? ColorsIndex[
                                          //                     Random().nextInt(3)]
                                          //                 : Colors.black12,

                                          borderRadius:
                                              BorderRadius.circular(12),
                                          // color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: width * 0.02,
                                            bottom: height * 0.01),
                                        width: double.infinity,
                                        height: height * 0.1,
                                        decoration: BoxDecoration(
                                          color: LightsIndex[
                                              inde % LightsIndex.length],
                                          // index == 0
                                          //     ? Colors.red
                                          //     : index == 1
                                          //         ? Colors.green
                                          //         : Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(provider
                                                      .classlist
                                                      ?.timetable[inde]
                                                      .schedule[index]
                                                      .date
                                                      .toString() ??
                                                  "kuldip"),
                                              SizedBox(
                                                height: height * 0.01,
                                              ),
                                              Text(
                                                provider
                                                        .classlist
                                                        ?.timetable[inde]
                                                        .schedule[index]
                                                        .name ??
                                                    "kuldip",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]);
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
