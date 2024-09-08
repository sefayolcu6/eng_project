import 'package:eng_project/category_screens/vegetables/vegetables_view_model/vegetables_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VegetablesCubit extends Cubit<VegetablesState> {
  VegetablesCubit() : super(VegetablesInitial());

  void refreshState() {
    emit(VegetablesDisplay());
  }
}
