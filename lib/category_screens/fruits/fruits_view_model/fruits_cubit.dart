import 'package:eng_project/category_screens/fruits/fruits_view_model/fruits_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitsCubit extends Cubit<FruitsState> {
  FruitsCubit() : super(FruitsInitial());

  void refreshState() {
    emit(FruitsDisplay());
  }
}
