import '../../../../../networking/base_client.dart';
import '../../../../../values/apis.dart';
import '../../domain/entities/questions_category_response.dart';
import '../../domain/repositories/ask_question_repository.dart';

class AskQuestionRepositoryImpl implements AskQuestionRepository {
  @override
  Future<List<QuestionCategory>> getQuestionCategories() async {
    var baseClient = BaseClient().dio;
    try {
      var response = await baseClient.get(APIs.getQuestionCategory);
      QuestionCategoryResponse questionCategoryResponse =
          QuestionCategoryResponse.fromJson(response.data);
      if (questionCategoryResponse.success == true) {
        return questionCategoryResponse.data ?? [];
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
