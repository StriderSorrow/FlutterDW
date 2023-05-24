import 'package:dw_front/cubit/character/cubit.dart';
import 'package:dw_front/cubit/track_list/track_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/navigation/cubit.dart';
import 'package:dw_front/cubit/registration/cubit.dart';
import 'package:dw_front/cubit/team/team_cubit.dart';
import 'package:dw_front/cubit/team_list/team_list_cubit.dart';
import 'package:dw_front/cubit/user/user_cubit.dart';
import 'package:dw_front/ui/app_navigator.dart';
import 'cubit/authorization/authorization_cubit.dart';
import 'cubit/project/project_cubit.dart';

void main() => runApp(const Starter());

class Starter extends StatelessWidget {
  const Starter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NavigationCubit>(create: (context) => NavigationCubit()),
          BlocProvider<AuthorizationCubit>(create: (context) => AuthorizationCubit()),
          BlocProvider<RegistrationCubit>(create: (context) => RegistrationCubit()),
          BlocProvider<UserCubit>(create: (context) => UserCubit()),
          BlocProvider<TeamCubit>(create: (context) => TeamCubit()),
          BlocProvider<TeamListCubit>(create: (context) => TeamListCubit()),
          BlocProvider<ProjectCubit>(create: (context) => ProjectCubit()),
          BlocProvider<CharacterCubit>(create: (context) => CharacterCubit()),
          //BlocProvider<TrackListCubit>(create: (context) => TrackListCubit()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: AppNavigator(),
          ),
        ));
  }
}
