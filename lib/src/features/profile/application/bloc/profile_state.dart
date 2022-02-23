part of 'profile_bloc.dart';

enum ProfileAction { view, edit, add }
enum Meridian { pm, am }

class ProfileState {
  bool isLoading;
  List<AllRelative> familyList;
  ProfileAction profileAction;
  Meridian meridian;
  List<Place> places;
  AllRelative? familyProfile;
  ProfileState(
      {required this.isLoading,
      required this.familyList,
      required this.profileAction,
      required this.places,
      this.familyProfile,
      this.meridian = Meridian.am});

  ProfileState copyWith(
      {bool? isLoading,
      List<AllRelative>? familyList,
      ProfileAction? profileAction,
      List<Place>? places,
      AllRelative? familyProfile,
      Meridian? meridian}) {
    return ProfileState(
        isLoading: isLoading ?? this.isLoading,
        familyList: familyList ?? this.familyList,
        profileAction: profileAction ?? this.profileAction,
        places: places ?? this.places,
        familyProfile: familyProfile ?? this.familyProfile,
        meridian: meridian ?? this.meridian);
  }

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, familyList: $familyList, profileAction: $profileAction, meridian: $meridian)';
  }
}
