import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/navigation/cubit.dart';
import 'package:dw_front/cubit/registration/cubit.dart';
import 'package:dw_front/cubit/team/cubit.dart';
import 'package:dw_front/cubit/team_list/cubit.dart';
import 'package:dw_front/cubit/user/cubit.dart';
import 'package:dw_front/ui/app_navigator.dart';
import 'cubit/authorization/cubit.dart';
import 'cubit/project/cubit.dart';
import 'cubit/project_add/project_add_cubit.dart';
import 'cubit/team_add/cubit.dart';
import 'cubit/scenario/cubit.dart';

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
          BlocProvider<TeamAddCubit>(create: (context) => TeamAddCubit()),
          BlocProvider<ProjectAddCubit>(create: (context) => ProjectAddCubit()),
          BlocProvider<ProjectCubit>(create: (context) => ProjectCubit()),
          BlocProvider<ScenarioCubit>(create: (context) => ScenarioCubit()),

        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: AppNavigator(),
          ),
        ),
    );
  }
}
