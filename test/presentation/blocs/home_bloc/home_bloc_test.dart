import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_med/domain/entities/category_summary_model.dart';
import 'package:smart_med/domain/irepositories/icategory_repository.dart';
import 'package:smart_med/presentation/blocs/home_screen_bloc/home_screen_bloc.dart';
import 'package:smart_med/presentation/blocs/home_screen_bloc/home_screen_event.dart';
import 'package:smart_med/presentation/blocs/home_screen_bloc/home_screen_state.dart';

class FakeCategoryRepository implements ICategoryRepository {
  List<CategorySummary> categories = [];
  Exception? exception;

  @override
  Future<List<CategorySummary>> getCategories() async {
    if (exception != null) {
      throw exception!;
    }
    return categories;
  }
}

CategorySummary _createCategory({int id = 1, String doctorType = 'Therapist'}) {
  return CategorySummary(
    id: id,
    doctorType: doctorType,
    workingHours: '9:00 - 18:00',
    doctorsAvailable: 10,
    categoryImage: 'assets/images/therapist.png',
    doctorAvatars: const ['avatar_1.png', 'avatar_2.png'],
    additionalCount: 8,
  );
}

void main() {
  group('HomeBloc', () {
    late FakeCategoryRepository repository;

    setUp(() {
      repository = FakeCategoryRepository();
    });

    blocTest<HomeScreenBloc, HomeScreenState>(
      'emits loading and success when categories are loaded successfully',
      build: () {
        repository.categories = [
          _createCategory(),
          _createCategory(id: 2, doctorType: 'Cardiologist'),
        ];

        return HomeScreenBloc(categoryRepository: repository);
      },
      act: (bloc) => bloc.add(const OnHomeStartedEvent()),
      expect: () => [
        const HomeLoadingState(),
        HomeSuccessState([_createCategory(), _createCategory(id: 2, doctorType: 'Cardiologist')]),
      ],
    );

    blocTest<HomeScreenBloc, HomeScreenState>(
      'emits loading and error when categories fail to load',
      build: () {
        repository.exception = Exception('Network error');

        return HomeScreenBloc(categoryRepository: repository);
      },
      act: (bloc) => bloc.add(const OnHomeStartedEvent()),
      expect: () => [
        const HomeLoadingState(),
        const HomeErrorState(message: 'Unable to load categories. Please try again.'),
      ],
    );

    blocTest<HomeScreenBloc, HomeScreenState>(
      'preserves current categories while refreshing',
      build: () {
        repository.categories = [_createCategory()];

        return HomeScreenBloc(categoryRepository: repository);
      },
      seed: () => HomeSuccessState([_createCategory()]),
      act: (bloc) {
        repository.categories = [_createCategory(id: 2, doctorType: 'Cardiologist')];

        bloc.add(const OnHomeRefreshEvent());
      },
      expect: () => [
        HomeLoadingState(categories: [_createCategory()]),
        HomeSuccessState([_createCategory(id: 2, doctorType: 'Cardiologist')]),
      ],
    );

    blocTest<HomeScreenBloc, HomeScreenState>(
      'preserves current categories when refresh fails',
      build: () {
        repository.exception = Exception('Network error');

        return HomeScreenBloc(categoryRepository: repository);
      },
      seed: () => HomeSuccessState([_createCategory()]),
      act: (bloc) => bloc.add(const OnHomeRefreshEvent()),
      expect: () => [
        HomeLoadingState(categories: [_createCategory()]),
        HomeErrorState(
          message: 'Unable to load categories. Please try again.',
          categories: [_createCategory()],
        ),
      ],
    );
  });
}
