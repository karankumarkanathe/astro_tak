import '../entities/delete_member_response.dart';
import '../repositories/profile_repository.dart';

class DeleteFamilyMember {
  final ProfileRepository profileRepository;

  DeleteFamilyMember(this.profileRepository);

  Future<CommonResponseModel> call(String uuid) =>
      profileRepository.deleteFamilyMembers(uuid);
}
