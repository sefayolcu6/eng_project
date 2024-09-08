import 'package:eng_project/category_screens/furnitures/furnitures_view_model/furnitures_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FurnituresCubit extends Cubit<FurnituresState> {
  FurnituresCubit() : super(FurnituresInitial());

  void refreshState() {
    emit(FurnituresDisplay());
  }
}
