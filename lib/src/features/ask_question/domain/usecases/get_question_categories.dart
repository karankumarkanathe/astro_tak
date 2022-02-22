import '../entities/questions_category_response.dart';
import '../repositories/ask_question_repository.dart';

class GetQuestionCategory {
  final AskQuestionRepository askQuestionRepository;

  GetQuestionCategory(this.askQuestionRepository);

  Future<List<QuestionCategory>> call() =>
      askQuestionRepository.getQuestionCategories();
}
