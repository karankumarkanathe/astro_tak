import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../injection_container.dart';
import '../../domain/entities/questions_category_response.dart';
import '../../domain/usecases/get_question_categories.dart';

part 'ask_question_event.dart';
part 'ask_question_state.dart';

class AskQuestionBloc extends Bloc<AskQuestionEvent, AskQuestionState> {
  AskQuestionBloc()
      : super(AskQuestionState(
            isLoading: false, questionCategories: [], selectedCategory: 0)) {
    on<GetQuestionCategoriesEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final questionCategories = await sl<GetQuestionCategory>().call();
      emit(state.copyWith(
          isLoading: false,
          questionCategories: questionCategories,
          selectedCategory: questionCategories.first.id));
    });

    on<OnCategoryChangedEvent>(
      (event, emit) {
        emit(state.copyWith(selectedCategory: event.categoryId));
      },
    );
  }
}
