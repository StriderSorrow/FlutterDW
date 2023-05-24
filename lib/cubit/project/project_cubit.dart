import 'package:flutter_bloc/flutter_bloc.dart';
import 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectEmptyState());

  Future<void> readyState() async {
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(ProjectLoadingState()));
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(ProjectReadyState()));
    //login.text;
    //password.text;
  }
}
