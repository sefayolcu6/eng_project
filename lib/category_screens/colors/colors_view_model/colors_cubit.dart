import 'package:eng_project/category_screens/colors/colors_view_model/colors_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsCubit extends Cubit<ColorsState> {
  ColorsCubit() : super(ColorsInitial());

  void refreshState() {
    emit(ColorsDisplay());
  }
}
