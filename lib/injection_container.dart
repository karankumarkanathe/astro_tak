import 'package:get_it/get_it.dart';

import 'src/features/ask_question/application/bloc/ask_question_bloc.dart';
import 'src/features/ask_question/data/repositories/ask_question_repository_impl.dart';
import 'src/features/ask_question/domain/repositories/ask_question_repository.dart';
import 'src/features/ask_question/domain/usecases/get_question_categories.dart';
import 'src/features/profile/application/bloc/profile_bloc.dart';
import 'src/features/profile/data/repositories/profile_repository_impl.dart';
import 'src/features/profile/domain/repositories/profile_repository.dart';
import 'src/features/profile/domain/usecases/add_user_profile.dart';
import 'src/features/profile/domain/usecases/delete_family_member.dart';
import 'src/features/profile/domain/usecases/get_family_members.dart';
import 'src/features/profile/domain/usecases/get_places_list.dart';
import 'src/features/profile/domain/usecases/update_user_profile.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<AskQuestionBloc>(() => AskQuestionBloc());
  sl.registerFactory<ProfileBloc>(() => ProfileBloc());

  sl.registerLazySingleton<GetQuestionCategory>(
      () => GetQuestionCategory(sl()));
  sl.registerLazySingleton<AskQuestionRepository>(
      () => AskQuestionRepositoryImpl());
  sl.registerLazySingleton<GetFamilyMembers>(() => GetFamilyMembers(sl()));
  sl.registerLazySingleton<DeleteFamilyMember>(() => DeleteFamilyMember(sl()));
  sl.registerLazySingleton<GetPlacesList>(() => GetPlacesList(sl()));
  sl.registerLazySingleton<AddUserProfile>(() => AddUserProfile(sl()));
  sl.registerLazySingleton<UpdateUserProfile>(() => UpdateUserProfile(sl()));

  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());
}
