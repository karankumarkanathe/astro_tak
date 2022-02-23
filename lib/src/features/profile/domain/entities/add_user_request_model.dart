import 'family_member_list_response.dart';
import 'places_list_response.dart';

class AddUserRequestModel {
  AddUserRequestModel({
    required this.birthDetails,
    required this.birthPlace,
    required this.firstName,
    required this.lastName,
    required this.relationId,
    required this.gender,
  });

  BirthDetails birthDetails;
  Place birthPlace;
  String firstName;
  String lastName;
  int relationId;
  String gender;

  factory AddUserRequestModel.fromJson(Map<String, dynamic> json) =>
      AddUserRequestModel(
        birthDetails: BirthDetails.fromJson(json["birthDetails"]),
        birthPlace: Place.fromJson(json["birthPlace"]),
        firstName: json["firstName"],
        lastName: json["lastName"],
        relationId: json["relationId"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "birthDetails": birthDetails.toJson(),
        "birthPlace": birthPlace.toJson(),
        "firstName": firstName,
        "lastName": lastName,
        "relationId": relationId,
        "gender": gender,
      };
}

// class BirthDetails {
//   BirthDetails({
//     required this.dobDay,
//     required this.dobMonth,
//     required this.dobYear,
//     required this.tobHour,
//     required this.tobMin,
//     required this.meridiem,
//   });

//   int dobDay;
//   int dobMonth;
//   int dobYear;
//   int tobHour;
//   int tobMin;
//   String meridiem;

//   factory BirthDetails.fromJson(Map<String, dynamic> json) => BirthDetails(
//         dobDay: json["dobDay"],
//         dobMonth: json["dobMonth"],
//         dobYear: json["dobYear"],
//         tobHour: json["tobHour"],
//         tobMin: json["tobMin"],
//         meridiem: json["meridiem"],
//       );

//   Map<String, dynamic> toJson() => {
//         "dobDay": dobDay,
//         "dobMonth": dobMonth,
//         "dobYear": dobYear,
//         "tobHour": tobHour,
//         "tobMin": tobMin,
//         "meridiem": meridiem,
//       };
// }

// class BirthPlace {
//   BirthPlace({
//     required this.placeName,
//     required this.placeId,
//   });

//   String placeName;
//   String placeId;

//   factory BirthPlace.fromJson(Map<String, dynamic> json) => BirthPlace(
//         placeName: json["placeName"],
//         placeId: json["placeId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "placeName": placeName,
//         "placeId": placeId,
//       };
// }
