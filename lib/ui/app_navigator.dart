import 'package:dw_front/ui/pages/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/navigation/cubit.dart';
import 'package:dw_front/ui/pages/authorization.dart';
import 'package:dw_front/ui/pages/project.dart';
import 'package:dw_front/ui/pages/registration.dart';
import 'package:dw_front/ui/pages/user.dart';
import 'package:dw_front/ui/pages/team.dart';
import 'package:dw_front/ui/pages/team_list.dart';


class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
      return Navigator(
        pages: [
          if (state is NavigationUserState)
            const MaterialPage(child: User()),
          if (state is NavigationRegistrationState)
             const MaterialPage(child: Registration()),
          if (state is NavigationAuthorizationState)
            const MaterialPage(child: Authorization()),
          if (state is NavigationTeamState)
            const MaterialPage(child: Team()),
          if (state is NavigationTeamListState)
            const MaterialPage(child: TeamList()),
          if (state is NavigationProjectState)
            const MaterialPage(child: Project()),
          if (state is NavigationCharacterState)
            const MaterialPage(child: Character()),
          // if (state is NavigationTrackListState)
          //   const MaterialPage(child: TrackList()),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      );
    });
  }
}
