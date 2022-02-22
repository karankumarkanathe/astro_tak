import 'package:get_it/get_it.dart';

import 'src/features/ask_question/application/bloc/ask_question_bloc.dart';
import 'src/features/ask_question/data/repositories/ask_question_repository_impl.dart';
import 'src/features/ask_question/domain/repositories/ask_question_repository.dart';
import 'src/features/ask_question/domain/usecases/get_question_categories.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<AskQuestionBloc>(() => AskQuestionBloc());

  sl.registerLazySingleton<GetQuestionCategory>(
      () => GetQuestionCategory(sl()));

  sl.registerLazySingleton<AskQuestionRepository>(
      () => AskQuestionRepositoryImpl());
}
