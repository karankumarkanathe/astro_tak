part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetFamilyListEvent extends ProfileEvent {}

class DeleteFamilyMemberEvent extends ProfileEvent {
  final String uuid;
  DeleteFamilyMemberEvent({
    required this.uuid,
  });
}

class AddProfileClickedEvent extends ProfileEvent {}

class EditProfileClickedEvent extends ProfileEvent {
  final AllRelative familyProfile;
  EditProfileClickedEvent(this.familyProfile);
}

class BackToFamilyListEvent extends ProfileEvent {}

class OnMeridianChangeEvent extends ProfileEvent {
  final Meridian meridian;

  OnMeridianChangeEvent(this.meridian);
}

class GetPlacesListEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String uuid;
  final AddUserRequestModel addUserRequestModel;

  UpdateProfileEvent(this.uuid, this.addUserRequestModel);
}

class AddProfileEvent extends ProfileEvent {
  final AddUserRequestModel addUserRequestModel;

  AddProfileEvent(this.addUserRequestModel);
}
