import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionCubit extends Cubit<String> {
  SelectionCubit(String initialState) : super(initialState);
  void select(String value) => emit(value);
}
