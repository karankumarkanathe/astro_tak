import '../entities/family_member_list_response.dart';
import '../repositories/profile_repository.dart';

class GetFamilyMembers {
  final ProfileRepository profileRepository;

  GetFamilyMembers(this.profileRepository);

  Future<List<AllRelative>> call() => profileRepository.getFamilyMembers();
}
