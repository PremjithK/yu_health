import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_switcher_state.dart';

class PageSwitcherCubit extends Cubit<int> {
  PageSwitcherCubit() : super(0);

  void switchPage(int index) => emit(index);
}
