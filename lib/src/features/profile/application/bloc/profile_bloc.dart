import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../injection_container.dart';
import '../../domain/entities/add_user_request_model.dart';
import '../../domain/entities/family_member_list_response.dart';
import '../../domain/entities/places_list_response.dart';
import '../../domain/usecases/add_user_profile.dart';
import '../../domain/usecases/delete_family_member.dart';
import '../../domain/usecases/get_family_members.dart';
import '../../domain/usecases/get_places_list.dart';
import '../../domain/usecases/update_user_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(ProfileState(
            isLoading: false,
            familyList: [],
            places: [],
            profileAction: ProfileAction.view)) {
    on<GetFamilyListEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final response = await sl<GetFamilyMembers>().call();
      emit(state.copyWith(isLoading: false, familyList: response));
    });
    on<DeleteFamilyMemberEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await sl<DeleteFamilyMember>().call(event.uuid);
      final response = await sl<GetFamilyMembers>().call();
      emit(state.copyWith(isLoading: false, familyList: response));
    });
    on<AddProfileClickedEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final places = await sl<GetPlacesList>().call();
      emit(state.copyWith(
          isLoading: false, profileAction: ProfileAction.add, places: places));
    });
    on<EditProfileClickedEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final places = await sl<GetPlacesList>().call();
      emit(state.copyWith(
          isLoading: false,
          profileAction: ProfileAction.edit,
          places: places,
          familyProfile: event.familyProfile));
    });
    on<BackToFamilyListEvent>((event, emit) async {
      emit(state.copyWith(isLoading: false, profileAction: ProfileAction.view));
    });
    on<OnMeridianChangeEvent>((event, emit) async {
      emit(state.copyWith(meridian: event.meridian));
    });
    on<GetPlacesListEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final places = await sl<GetPlacesList>().call();
      emit(state.copyWith(isLoading: false, places: places));
    });
    on<AddProfileEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await sl<AddUserProfile>().call(event.addUserRequestModel);
      emit(state.copyWith(isLoading: false, profileAction: ProfileAction.view));
      add(GetFamilyListEvent());
    });
    on<UpdateProfileEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await sl<UpdateUserProfile>().call(event.uuid, event.addUserRequestModel);
      emit(state.copyWith(isLoading: false));
      emit(state.copyWith(isLoading: false, profileAction: ProfileAction.view));
      add(GetFamilyListEvent());
    });
  }
}
