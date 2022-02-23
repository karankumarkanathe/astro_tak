import 'package:dio/dio.dart';

import '../../../../../networking/base_client.dart';
import '../../../../../values/apis.dart';
import '../../domain/entities/add_user_request_model.dart';
import '../../domain/entities/delete_member_response.dart';
import '../../domain/entities/family_member_list_response.dart';
import '../../domain/entities/places_list_response.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<List<AllRelative>> getFamilyMembers() async {
    final baseClient = BaseClient().dio;
    try {
      final response = await baseClient.get(APIs.getFamilyMemberList,
          options: Options(headers: {'Authorization': bearerToken}));
      FamilyMemberListResponse familyMemberListResponse =
          FamilyMemberListResponse.fromJson(response.data);
      if (familyMemberListResponse.success) {
        if (familyMemberListResponse.data != null) {
          return familyMemberListResponse.data!.allRelatives;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<CommonResponseModel> deleteFamilyMembers(String uuid) async {
    final baseClient = BaseClient().dio;
    try {
      final response = await baseClient.post(APIs.deleteFamilyMember + uuid,
          options: Options(headers: {'Authorization': bearerToken}));
      return CommonResponseModel.fromJson(response.data);
    } catch (e) {
      return CommonResponseModel(
          apiName: "Delete user relative by uuid.",
          httpStatus: 'Error',
          httpStatusCode: 400,
          message: 'Something went wrong',
          success: false);
    }
  }

  @override
  Future<List<Place>> getPlaces() async {
    var baseClient = BaseClient().dio;
    try {
      var response = await baseClient.get(APIs.getPlaces);
      PlacesListResponse placesListResponse =
          PlacesListResponse.fromJson(response.data);
      if (placesListResponse.success == true) {
        return placesListResponse.data ?? [];
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<CommonResponseModel> addProfile(
      AddUserRequestModel addUserRequestModel) async {
    final baseClient = BaseClient().dio;
    try {
      final response = await baseClient.post(APIs.addProfile,
          data: addUserRequestModel.toJson(),
          options: Options(headers: {'Authorization': bearerToken}));
      return CommonResponseModel.fromJson(response.data);
    } catch (e) {
      return CommonResponseModel(
          apiName: "",
          httpStatus: 'Error',
          httpStatusCode: 400,
          message: 'Something went wrong',
          success: false);
    }
  }

  @override
  Future<CommonResponseModel> updateProfile(
      String uuid, AddUserRequestModel addUserRequestModel) async {
    final baseClient = BaseClient().dio;
    try {
      final response = await baseClient.post(APIs.updateProfile + uuid,
          data: addUserRequestModel.toJson(),
          options: Options(headers: {'Authorization': bearerToken}));
      return CommonResponseModel.fromJson(response.data);
    } catch (e) {
      return CommonResponseModel(
          apiName: "",
          httpStatus: 'Error',
          httpStatusCode: 400,
          message: 'Something went wrong',
          success: false);
    }
  }
}
