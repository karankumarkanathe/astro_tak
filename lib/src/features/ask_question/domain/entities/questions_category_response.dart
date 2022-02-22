class QuestionCategoryResponse {
  QuestionCategoryResponse({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  String? apiName;
  List<QuestionCategory>? data;

  factory QuestionCategoryResponse.fromJson(Map<String, dynamic> json) =>
      QuestionCategoryResponse(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: List<QuestionCategory>.from(
            json["data"].map((x) => QuestionCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class QuestionCategory {
  QuestionCategory({
    this.id,
    this.name,
    this.description,
    this.price,
    this.suggestions,
  });

  int? id;
  String? name;
  String? description;
  double? price;
  List<String>? suggestions;

  factory QuestionCategory.fromJson(Map<String, dynamic> json) =>
      QuestionCategory(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        suggestions: List<String>.from(json["suggestions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "suggestions": suggestions == null
            ? null
            : List<dynamic>.from(suggestions!.map((x) => x)),
      };
}
