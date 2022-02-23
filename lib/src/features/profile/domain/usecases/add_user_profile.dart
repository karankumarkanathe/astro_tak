import '../entities/add_user_request_model.dart';
import '../entities/delete_member_response.dart';
import '../repositories/profile_repository.dart';

class AddUserProfile {
  final ProfileRepository profileRepository;

  AddUserProfile(this.profileRepository);

  Future<CommonResponseModel> call(AddUserRequestModel addUserRequestModel) =>
      profileRepository.addProfile(addUserRequestModel);
}
