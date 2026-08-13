import 'package:smart_med/domain/entities/category_summary_model.dart';
import 'package:smart_med/domain/irepositories/icategory_repository.dart';
import 'package:smart_med/infra/mocks/mock_categories.dart';

class CategoryRepository implements ICategoryRepository {
  @override
  Future<List<CategorySummary>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return mockCategorySummaries;
  }
}
