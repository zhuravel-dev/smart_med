import 'package:equatable/equatable.dart';
import 'package:smart_med/domain/entities/category_summary_model.dart';

sealed class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object?> get props => [];
}

final class HomeInitialState extends HomeScreenState {
  const HomeInitialState();
}

final class HomeLoadingState extends HomeScreenState {
  final List<CategorySummary> categories;

  const HomeLoadingState({this.categories = const []});
  bool get hasContent => categories.isNotEmpty;

  @override
  List<Object?> get props => [categories];
}

final class HomeSuccessState extends HomeScreenState {
  final List<CategorySummary> categories;
  const HomeSuccessState(this.categories);

  @override
  List<Object?> get props => [categories];
}

final class HomeErrorState extends HomeScreenState {
  final String message;
  final List<CategorySummary> categories;

  const HomeErrorState({required this.message, this.categories = const []});
  bool get hasContent => categories.isNotEmpty;

  @override
  List<Object?> get props => [message, categories];
}
