// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel {
    RegistrationModel({
        this.result,
        this.message,
        this.userId,
    });

    bool ? result;
    String ? message;
    int ? userId;

    factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
        result: json["result"],
        message: json["message"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "user_id": userId,
    };
}
