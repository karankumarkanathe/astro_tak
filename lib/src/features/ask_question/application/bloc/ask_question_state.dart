part of 'ask_question_bloc.dart';

class AskQuestionState {
  final bool isLoading;
  final List<QuestionCategory> questionCategories;
  final int selectedCategory;

  AskQuestionState(
      {required this.isLoading,
      required this.questionCategories,
      required this.selectedCategory});

  AskQuestionState copyWith({
    bool? isLoading,
    List<QuestionCategory>? questionCategories,
    int? selectedCategory,
  }) {
    return AskQuestionState( isLoading:
      isLoading ?? this.isLoading,
      questionCategories: questionCategories ?? this.questionCategories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  String toString() => 'AskQuestionState(isLoading: $isLoading, questionCategories: $questionCategories, selectedCategory: $selectedCategory)';
}
