import 'package:flutter_bloc/flutter_bloc.dart';

class GenericCubit<T> extends Cubit<T> {
  GenericCubit(super.initialState);

  void update(T newState) => emit(newState);
}
