import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit(int initialState) : super(initialState);
  void navigateTo(int index) => emit(index);
}
