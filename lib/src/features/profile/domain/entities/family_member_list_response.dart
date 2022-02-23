import 'places_list_response.dart';

class FamilyMemberListResponse {
  FamilyMemberListResponse({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.apiName,
    this.data,
  });

  String httpStatus;
  int httpStatusCode;
  bool success;
  String message;
  String apiName;
  FamilyData? data;

  factory FamilyMemberListResponse.fromJson(Map<String, dynamic> json) =>
      FamilyMemberListResponse(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: FamilyData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": data == null ? null : data!.toJson(),
      };
}

class FamilyData {
  FamilyData({
    required this.pageNo,
    required this.numberOfElements,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.allRelatives,
  });

  int pageNo;
  int numberOfElements;
  int pageSize;
  int totalElements;
  int totalPages;
  List<AllRelative> allRelatives;

  factory FamilyData.fromJson(Map<String, dynamic> json) => FamilyData(
        pageNo: json["pageNo"],
        numberOfElements: json["numberOfElements"],
        pageSize: json["pageSize"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        allRelatives: List<AllRelative>.from(
            json["allRelatives"].map((x) => AllRelative.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageNo": pageNo,
        "numberOfElements": numberOfElements,
        "pageSize": pageSize,
        "totalElements": totalElements,
        "totalPages": totalPages,
        "allRelatives": List<dynamic>.from(allRelatives.map((x) => x.toJson())),
      };
}

class AllRelative {
  AllRelative({
    this.uuid,
    this.relation,
    this.relationId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.gender,
    this.dateAndTimeOfBirth,
    this.birthDetails,
    this.birthPlace,
  });

  String? uuid;
  String? relation;
  int? relationId;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? fullName;
  String? gender;
  DateTime? dateAndTimeOfBirth;
  BirthDetails? birthDetails;
  Place? birthPlace;

  factory AllRelative.fromJson(Map<String, dynamic> json) => AllRelative(
        uuid: json["uuid"],
        relation: json["relation"],
        relationId: json["relationId"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        gender: json["gender"],
        dateAndTimeOfBirth: DateTime.parse(json["dateAndTimeOfBirth"]),
        birthDetails: BirthDetails.fromJson(json["birthDetails"]),
        birthPlace: Place.fromJson(json["birthPlace"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "relation": relation,
        "relationId": relationId,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "fullName": fullName,
        "gender": gender,
        "dateAndTimeOfBirth": dateAndTimeOfBirth == null
            ? null
            : dateAndTimeOfBirth!.toIso8601String(),
        "birthDetails": birthDetails == null ? null : birthDetails!.toJson(),
        "birthPlace": birthPlace == null ? null : birthPlace!.toJson(),
      };
}

class BirthDetails {
  BirthDetails({
    this.dobYear,
    this.dobMonth,
    this.dobDay,
    this.tobHour,
    this.tobMin,
    this.meridiem,
  });

  int? dobYear;
  int? dobMonth;
  int? dobDay;
  int? tobHour;
  int? tobMin;
  String? meridiem;

  factory BirthDetails.fromJson(Map<String, dynamic> json) => BirthDetails(
        dobYear: json["dobYear"],
        dobMonth: json["dobMonth"],
        dobDay: json["dobDay"],
        tobHour: json["tobHour"],
        tobMin: json["tobMin"],
        meridiem: json["meridiem"],
      );

  Map<String, dynamic> toJson() => {
        "dobYear": dobYear,
        "dobMonth": dobMonth,
        "dobDay": dobDay,
        "tobHour": tobHour,
        "tobMin": tobMin,
        "meridiem": meridiem,
      };
}
