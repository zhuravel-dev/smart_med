import 'package:smart_med/domain/entities/category_summary_model.dart';

abstract class ICategoryRepository {
  Future<List<CategorySummary>> getCategories();
}
