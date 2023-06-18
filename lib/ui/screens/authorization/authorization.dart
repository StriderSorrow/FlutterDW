import 'package:dw_front/cubit/navigation/navigation_cubit.dart';
import 'package:dw_front/ui/screens/authorization/authorization_confirm_screen.dart';
import 'package:dw_front/ui/screens/authorization/authorization_ready_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/authorization/cubit.dart';

class Authorization extends StatelessWidget {
  const Authorization({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationCubit, AuthorizationState>(
        builder: (context, state) {
      var _cubit = context.read<AuthorizationCubit>();
      if (state is AuthorizationEmptyState) {
        _cubit.tryLoad();
      }
      if (state is AuthorizationLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is AuthorizationReadyState) {
        return const AuthorizationReadyScreen();
      }
      if (state is AuthorizationConfirmState) {
        return const AuthorizationConfirmScreen();
      }
      if (state is AuthorizationAuthorizedState){
        context
            .read<NavigationCubit>()
            .pushToUserScene();
      }
      return const SizedBox.shrink();
    });
  }
}
