import 'package:dw_front/cubit/navigation/cubit.dart';
import 'package:dw_front/cubit/project_add/cubit.dart';
import 'package:dw_front/ui/screens/project_add/project_add_ready_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectAdd extends StatelessWidget {
  const ProjectAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectAddCubit, ProjectAddState>(builder: (context, state) {
      var _cubit = context.read<ProjectAddCubit>();
      if (state is ProjectAddEmptyState) {
        _cubit.readyState();
      }
      if (state is ProjectAddLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ProjectAddReadyState) {
        return const ProjectAddReadyScreen();
      }
      if (state is ProjectAddedState) {
        context
            .read<NavigationCubit>()
            .pushToTeamListScene();
      }
      return const SizedBox.shrink();
    });
  }
}
