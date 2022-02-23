import '../entities/add_user_request_model.dart';
import '../entities/delete_member_response.dart';
import '../entities/family_member_list_response.dart';
import '../entities/places_list_response.dart';

abstract class ProfileRepository {
  Future<List<AllRelative>> getFamilyMembers();
  Future<CommonResponseModel> deleteFamilyMembers(String uuid);
  Future<CommonResponseModel> updateProfile(String uuid, AddUserRequestModel addUserRequestModel);
  Future<CommonResponseModel> addProfile(AddUserRequestModel addUserRequestModel);
  Future<List<Place>> getPlaces();
}
