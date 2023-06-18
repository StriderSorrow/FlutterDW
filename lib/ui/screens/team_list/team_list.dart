import 'package:dw_front/cubit/team_list/cubit.dart';
import 'package:dw_front/ui/screens/team_list/empty_team_list_ready_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamList extends StatelessWidget {
  const TeamList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamListCubit, TeamListState>(builder: (context, state) {
      var _cubit = context.read<TeamListCubit>();
      if (state is TeamListEmptyState) {
        _cubit.readyState();
      }
      if (state is TeamListLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is TeamListReadyState) {
        return const EmptyTeamListReadyScreen();
      }
      return const SizedBox.shrink();
    });
  }
}
