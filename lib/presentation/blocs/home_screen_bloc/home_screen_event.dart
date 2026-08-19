import 'package:equatable/equatable.dart';

sealed class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object?> get props => [];
}

final class OnHomeStartedEvent extends HomeScreenEvent {
  const OnHomeStartedEvent();
}

final class OnHomeRefreshEvent extends HomeScreenEvent {
  const OnHomeRefreshEvent();
}
