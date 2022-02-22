part of 'ask_question_bloc.dart';

@immutable
abstract class AskQuestionEvent {}

class GetQuestionCategoriesEvent extends AskQuestionEvent {}

class OnCategoryChangedEvent extends AskQuestionEvent {
  final int categoryId;

  OnCategoryChangedEvent(this.categoryId);
}
