import 'package:eng_project/category_screens/animals/animals_view_model/animals_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalsCubit extends Cubit<AnimalsState> {
  AnimalsCubit() : super(AnimalsInitial());

  void refreshState() {
    emit(AnimalsDisplay());
  }
}
