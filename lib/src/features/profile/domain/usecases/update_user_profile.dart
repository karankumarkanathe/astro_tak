import '../entities/add_user_request_model.dart';
import '../entities/delete_member_response.dart';
import '../repositories/profile_repository.dart';

class UpdateUserProfile {
  final ProfileRepository profileRepository;

  UpdateUserProfile(this.profileRepository);

  Future<CommonResponseModel> call(
          String uuid, AddUserRequestModel addUserRequestModel) =>
      profileRepository.updateProfile(uuid, addUserRequestModel);
}
