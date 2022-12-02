import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:post_api_k/provider/app_satte.dart';
import 'package:provider/provider.dart';

class StudentData extends StatefulWidget {
  const StudentData({super.key});
  @override
  State<StudentData> createState() => _StudentDataState();
}

class _StudentDataState extends State<StudentData> {
  bool circleindicator = true;
  @override
  void initState() {
    Provider.of<AppState>(context, listen: false).Tutordetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AppState>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return Consumer<AppState>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.classlist?.students.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(bottom: height * 0.05),
              child: Row(
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          provider.classlist?.students[index].profilePicture ??
                              "kuldip"),
                      radius: 25,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Text(
                    provider.classlist?.students[index].name ?? "kuldip",
                    style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
            // ListTile(
            //   leading: Card(
            //     elevation: 5,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(32)),
            //     child: CircleAvatar(
            //       backgroundImage: NetworkImage(
            //           provider.classlist?.students[index].profilePicture ??
            //               "kuldip"),
            //       radius: 25,
            //     ),

            //   ),
            //   title: Text(provider.classlist?.students[index].name ?? "kuldip"),
            // );
          },
        );
      },
    );
  }
}
