// To parse this JSON data, do
//
//     final getdata = getdataFromJson(jsonString);

import 'dart:convert';

Getdata getdataFromJson(String str) => Getdata.fromJson(json.decode(str));

String getdataToJson(Getdata data) => json.encode(data.toJson());

class Getdata {
  Getdata({
    this.classDetails,
  });

  ClassDetails? classDetails;

  factory Getdata.fromJson(Map<String, dynamic> json) => Getdata(
        classDetails: ClassDetails.fromJson(json["classDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "classDetails": classDetails!.toJson(),
      };
}

class ClassDetails {
  ClassDetails({
    this.id,
    this.className,
    this.group,
    this.tutor,
    this.students,
    this.timetable,
  });

  String? id;
  String? className;
  String? group;
  Tutor? tutor;
  List<Tutor>? students;
  List<Timetable>? timetable;

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
        "tutor": tutor!.toJson(),
        "students": List<dynamic>.from(students!.map((x) => x.toJson())),
        "timetable": List<dynamic>.from(timetable!.map((x) => x.toJson())),
      };
}

class Tutor {
  Tutor({
    this.id,
    this.name,
    this.surname,
    this.profilePicture,
  });

  String? id;
  String? name;
  String? surname;
  String? profilePicture;

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
    this.date,
    this.schedule,
  });

  String? date;
  List<Schedule>? schedule;

  factory Timetable.fromJson(Map<String, dynamic> json) => Timetable(
        date: json["date"],
        schedule: List<Schedule>.from(
            json["schedule"].map((x) => Schedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "schedule": List<dynamic>.from(schedule!.map((x) => x.toJson())),
      };
}

class Schedule {
  Schedule({
    this.id,
    this.date,
    this.name,
    this.time,
  });

  String? id;
  DateTime? date;
  String? name;
  String? time;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["_id"],
        date: DateTime.parse(json["date"]),
        name: json["name"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date!.toIso8601String(),
        "name": name,
        "time": time,
      };
}
