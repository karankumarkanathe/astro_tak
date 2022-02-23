import '../entities/places_list_response.dart';
import '../repositories/profile_repository.dart';

class GetPlacesList {
  final ProfileRepository profileRepository;

  GetPlacesList(this.profileRepository);

  Future<List<Place>> call() => profileRepository.getPlaces();
}
