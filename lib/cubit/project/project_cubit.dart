import 'package:dw_front/cubit/project/project_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
