import 'package:eng_project/category_screens/jobs/jobs_view_model/jobs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsCubit extends Cubit<JobsState> {
  JobsCubit() : super(JobsInitial());

  void refreshState() {
    emit(JobsDisplay());
  }
}
