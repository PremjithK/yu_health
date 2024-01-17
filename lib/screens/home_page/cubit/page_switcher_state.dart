part of 'page_switcher_cubit.dart';

sealed class PageSwitcherState extends Equatable {
  const PageSwitcherState();

  @override
  List<Object> get props => [];
}

final class SwitchPage extends PageSwitcherState {
  final int index;
  const SwitchPage({required this.index});

  @override
  List<Object> get props => [index];
}
