// To parse this JSON data, do
//
//     final loginApiResponse = loginApiResponseFromJson(jsonString);

import 'dart:convert';

LoginApiResponse loginApiResponseFromJson(String str) => LoginApiResponse.fromJson(json.decode(str));

String loginApiResponseToJson(LoginApiResponse data) => json.encode(data.toJson());

class LoginApiResponse {
    LoginApiResponse({
        this.message,
        this.user,
    });

    String? message;
    User? user;

    factory LoginApiResponse.fromJson(Map<String, dynamic> json) => LoginApiResponse(
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user!.toJson(),
    };
}

class User {
    User({
        this.id,
        // this.dob,
        this.parentName,
        this.parentSurname,
        this.phoneNumber,
        this.email,
        this.password,
        this.studentId,
        this.profilePicture,
        this.status,
        // this.createdAt,
        // this.updatedAt,
        this.v,
        this.loginToken,
        this.name,
        this.surname,
    });

    String? id;
    // DateTime? dob;
    String? parentName;
    String? parentSurname;
    String? phoneNumber;
    String? email;
    String? password;
    String? studentId;
    String? profilePicture;
    bool? status;
    // DateTime? createdAt;
    // DateTime? updatedAt;
    int? v;
    String? loginToken;
    String? name;
    String? surname;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        // dob: DateTime.parse(json["dob"]),
        parentName: json["parentName"],
        parentSurname: json["parentSurname"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        studentId: json["studentId"],
        profilePicture: json["profilePicture"],
        status: json["status"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        loginToken: json["loginToken"],
        name: json["name"],
        surname: json["surname"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        // "dob": dob!.toIso8601String(),
        "parentName": parentName,
        "parentSurname": parentSurname,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "studentId": studentId,
        "profilePicture": profilePicture,
        "status": status,
        // "createdAt": createdAt!.toIso8601String(),
        // "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "loginToken": loginToken,
        "name": name,
        "surname": surname,
    };
}
