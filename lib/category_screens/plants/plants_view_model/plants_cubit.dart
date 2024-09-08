import 'package:eng_project/category_screens/plants/plants_view_model/plants_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlantsCubit extends Cubit<PlantsState> {
  PlantsCubit() : super(PlantsInitial());

  void refreshState() {
    emit(PlantsDisplay());
  }
}
