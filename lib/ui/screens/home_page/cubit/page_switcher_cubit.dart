import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_switcher_state.dart';

class PageSwitcherCubit extends Cubit<PageSwitcherState> {
  PageSwitcherCubit() : super(const SwitchPage(index: 0));

  void switchPage(int index) => emit(SwitchPage(index: index));
}
