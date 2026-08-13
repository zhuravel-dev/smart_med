import 'package:bloc/bloc.dart';
import 'package:smart_med/domain/entities/category_summary_model.dart';
import 'package:smart_med/domain/irepositories/icategory_repository.dart';
import 'package:smart_med_strings/smart_med_strings.dart';
import 'home_screen_event.dart';
import 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {

  final ICategoryRepository _categoryRepository;

  HomeScreenBloc({required ICategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository,
      super(const HomeInitialState()) {
    on<OnHomeStartedEvent>(_onHomeStarted);
    on<OnHomeRefreshEvent>(_onHomeRefresh);
  }

  Future<void> _onHomeStarted(OnHomeStartedEvent event, Emitter<HomeScreenState> emit) async {
    await _loadCategories(emit, preserveCurrentContent: false);
  }

  Future<void> _onHomeRefresh(OnHomeRefreshEvent event, Emitter<HomeScreenState> emit) async {
    await _loadCategories(emit, preserveCurrentContent: true);
  }

  Future<void> _loadCategories(
    Emitter<HomeScreenState> emit, {
    required bool preserveCurrentContent,
  }) async {
    final List<CategorySummary> currentCategories;

    if (preserveCurrentContent) {
      currentCategories = _currentCategories;
    } else {
      currentCategories = const [];
    }

    emit(HomeLoadingState(categories: currentCategories));

    try {
      final categories = await _categoryRepository.getCategories();

      emit(HomeSuccessState(categories));
    } catch (_) {
      emit(HomeErrorState(message: CommonStrings.loadErrorMessage, categories: currentCategories));
    }
  }

  List<CategorySummary> get _currentCategories {
    final currentState = state;

    if (currentState is HomeLoadingState) {
      return currentState.categories;
    }

    if (currentState is HomeSuccessState) {
      return currentState.categories;
    }

    if (currentState is HomeErrorState) {
      return currentState.categories;
    }

    return const [];
  }
}
