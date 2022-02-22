import '../entities/questions_category_response.dart';

abstract class AskQuestionRepository {
  Future<List<QuestionCategory>> getQuestionCategories();
}
