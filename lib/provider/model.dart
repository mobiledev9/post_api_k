// // To parse this JSON data, do
// //
// //     final dataModel = dataModelFromJson(jsonString);

// import 'dart:convert';

// // List<DataModel> dataModelFromJson(String str) => List<DataModel>.from(
// //     json.decode(str).map((x) => DataModel.fromJson(x)));

// // String dataModelToJson(List<DataModel> data) =>
// //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class DataModel {
//   DataModel({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//   });

//   int userId;
//   int id;
//   String title;
//   String body;

//   factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "id": id,
//         "title": title,
//         "body": body,
//       };
// }

// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

// import 'dart:convert';

// import 'package:flutter/material.dart';

// class Tutor {
//     Tutor({
//         this.id,
//         // this.dob,
//         this.email,
//         this.phoneNumber,
//         this.tutorId,
//         this.password,
//         this.profilePicture,
//         this.status,
//         this.loginToken,
//         this.degree,
//         this.gender,
//         this.name,
//         this.surname,
//     });

//     String? id;
//     // DateTime? dob;
//     String? email;
//     String? phoneNumber;
//     String? tutorId;
//     String? password;
//     String? profilePicture;
//     bool? status;
//     String? loginToken;
//     String? degree;
//     String? gender;
//     String? name;
//     String? surname;

//     factory Tutor.fromMap(element) => Tutor(
//         id: element["_id"],
//         // dob: DateTime.parse(element["dob"]),
//         email: element["email"],
//         phoneNumber: element["phoneNumber"],
//         tutorId: element["tutorId"],
//         password: element["password"],
//         profilePicture: element["profilePicture"] ,
//         status: element["status"],
//         loginToken: element["loginToken"],
//         degree: element["degree"],
//         gender: element["gender"],
//         name: element["name"],
//         surname: element["surname"],
//     );

//   get isEmpty => null;

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         // "dob": dob!.toIso8601String(),
//         "email": email,
//         "phoneNumber": phoneNumber,
//         "tutorId": tutorId,
//         "password": password,
//         "profilePicture": profilePicture == null ? null : profilePicture,
//         "status": status,
//         "loginToken": loginToken == null ? null : loginToken,
//         "degree": degree,
//         "gender": gender,
//         "name": name,
//         "surname": surname,
//     };
// }

// To parse this JSON data, do
//
//     final tutormodel = tutormodelFromJson(jsonString);

// import 'dart:convert';

import 'dart:convert';

Tutormodel tutormodelFromJson(String str) =>
    Tutormodel.fromJson(json.decode(str));

String tutormodelToJson(Tutormodel data) => json.encode(data.toJson());

class Tutormodel {
  Tutormodel({
    required this.classDetails,
  });

  ClassDetails classDetails;

  factory Tutormodel.fromJson(Map<String, dynamic> json) => Tutormodel(
        classDetails: ClassDetails.fromJson(json["classDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "classDetails": classDetails.toJson(),
      };
}

class ClassDetails {
  ClassDetails({
    required this.id,
    required this.className,
    required this.group,
    required this.tutor,
    required this.students,
    required this.timetable,
  });

  String id;
  String className;
  String group;
  Tutor tutor;
  List<Tutor> students;
  List<Timetable> timetable;

  factory ClassDetails.fromJson(Map<String, dynamic> json) => ClassDetails(
        id: json["_id"],
        className: json["className"],
        group: json["group"],
        tutor: Tutor.fromJson(json["tutor"]),
        students:
            List<Tutor>.from(json["students"].map((x) => Tutor.fromJson(x))),
        timetable: List<Timetable>.from(
            json["timetable"].map((x) => Timetable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "className": className,
        "group": group,
        "tutor": tutor.toJson(),
        "students": List<dynamic>.from(students.map((x) => x.toJson())),
        "timetable": List<dynamic>.from(timetable.map((x) => x.toJson())),
      };
}

class Tutor {
  Tutor({
    required this.id,
    required this.name,
    required this.surname,
    required this.profilePicture,
  });

  String id;
  String name;
  String surname;
  String profilePicture;

  factory Tutor.fromJson(Map<String, dynamic> json) => Tutor(
        id: json["_id"],
        name: json["name"],
        surname: json["surname"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "surname": surname,
        "profilePicture": profilePicture,
      };
}

class Timetable {
  Timetable({
    required this.date,
    required this.schedule,
  });

  String date;
  List<Schedule> schedule;

  factory Timetable.fromJson(Map<String, dynamic> json) => Timetable(
        date: json["date"],
        schedule: List<Schedule>.from(
            json["schedule"].map((x) => Schedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
      };
}

class Schedule {
  Schedule({
    required this.id,
    required this.date,
    required this.name,
    required this.time,
  });

  String id;
  DateTime date;
  String name;
  String time;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["_id"],
        date: DateTime.parse(json["date"]),
        name: json["name"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date.toIso8601String(),
        "name": name,
        "time": time,
      };
}
