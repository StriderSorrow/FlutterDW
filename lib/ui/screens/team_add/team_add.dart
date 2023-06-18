import 'package:dw_front/cubit/navigation/cubit.dart';
import 'package:dw_front/cubit/team_add/cubit.dart';
import 'package:dw_front/ui/screens/team_add/team_add_ready_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamAdd extends StatelessWidget {
  const TeamAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamAddCubit, TeamAddState>(builder: (context, state) {
      var _cubit = context.read<TeamAddCubit>();
      if (state is TeamAddEmptyState) {
        _cubit.readyState();
      }
      if (state is TeamAddLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is TeamAddReadyState) {
        return const TeamAddReadyScreen();
      }
      if (state is TeamAddedState) {
        context
            .read<NavigationCubit>()
            .pushToTeamListScene();
      }
      return const SizedBox.shrink();
    });
  }
}
