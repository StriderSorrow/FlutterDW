import 'package:dw_front/ui/screens/scenario/scenario.dart';
import 'package:dw_front/ui/screens/team_add/team_add.dart';
import 'package:dw_front/ui/screens/project_add/project_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/navigation/cubit.dart';
import 'package:dw_front/ui/screens/authorization/authorization.dart';
import 'package:dw_front/ui/screens/project/project.dart';
import 'package:dw_front/ui/screens/registration/registration.dart';
import 'package:dw_front/ui/screens/user/user.dart';
import 'package:dw_front/ui/screens/team/team.dart';
import 'package:dw_front/ui/screens/team_list/team_list.dart';


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
          if (state is NavigationTeamAddState)
            const MaterialPage(child: TeamAdd()),
          if (state is NavigationProjectAddState)
            const MaterialPage(child: ProjectAdd()),
          if (state is NavigationProjectState)
            const MaterialPage(child: Project()),
          if (state is NavigationScenarioState)
            const MaterialPage(child: Scenario()),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      );
    });
  }
}
