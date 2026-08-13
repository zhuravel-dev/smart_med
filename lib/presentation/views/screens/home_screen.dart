import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_med/domain/entities/category_summary_model.dart';
import 'package:smart_med/domain/irepositories/icategory_repository.dart';
import 'package:smart_med/presentation/blocs/home_screen_bloc/home_screen_bloc.dart';
import 'package:smart_med/presentation/blocs/home_screen_bloc/home_screen_event.dart';
import 'package:smart_med/presentation/blocs/home_screen_bloc/home_screen_state.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';
import 'package:smart_med/presentation/views/components/error_retry.dart';
import 'package:smart_med/presentation/views/components/home_greeting_header.dart';
import 'package:smart_med/presentation/views/components/main_cards_row.dart';
import 'package:smart_med/presentation/views/components/make_appointment_title.dart';
import 'package:smart_med/presentation/views/components/tags_row.dart';
import 'package:smart_med/presentation/views/components/custom_app_bar/greeting_header.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool>? onScrollDirectionChanged;
  final VoidCallback? onOpenAppointment;

  const HomeScreen({super.key, this.onScrollDirectionChanged, this.onOpenAppointment});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  double _lastScrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (!_scrollController.hasClients) return;
    final currentOffset = _scrollController.offset;
    if ((currentOffset - _lastScrollOffset).abs() < 5) {
      return;
    }

    if (currentOffset <= 0) {
      widget.onScrollDirectionChanged?.call(false);
      _lastScrollOffset = currentOffset;
      return;
    }

    final isScrollingDown = currentOffset > _lastScrollOffset;
    widget.onScrollDirectionChanged?.call(isScrollingDown);
    _lastScrollOffset = currentOffset;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HomeScreenBloc(categoryRepository: GetIt.I<ICategoryRepository>())
            ..add(const OnHomeStartedEvent()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) => _buildBody(context, state),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, HomeScreenState state) {
    return switch (state) {
      HomeInitialState() => const Center(child: CircularProgressIndicator()),

      HomeLoadingState(:final categories) =>
        categories.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : _buildContent(categories),

      HomeSuccessState(:final categories) => _buildContent(categories),

      HomeErrorState(:final message, :final categories) =>
        categories.isEmpty
            ? ErrorRetry(
                message: message,
                onRetry: () {
                  context.read<HomeScreenBloc>().add(const OnHomeRefreshEvent());
                },
              )
            : _buildContent(categories, errorMessage: message),
    };
  }

  Widget _buildContent(List<CategorySummary> categories, {String? errorMessage}) {
    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(height: 8),
        const GreetingHeader(type: GreetingHeaderType.main),
        const SizedBox(height: 20),
        makeTitle(firstText: 'Make an', secondText: 'Appointment'),
        const SizedBox(height: 24),
        const TagsRow(),
        const SizedBox(height: 16),
        MainCardsRow(categories: categories, onOpenAppointment: widget.onOpenAppointment),
        if (errorMessage != null) ...[
          const SizedBox(height: 16),
          Text(errorMessage, textAlign: TextAlign.center),
        ],
        const SizedBox(height: 120),
      ],
    );
  }
}
