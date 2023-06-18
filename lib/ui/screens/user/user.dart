import 'package:dw_front/ui/screens/user/user_ready_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/user/cubit.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      var _cubit = context.read<UserCubit>();
      if (state is UserEmptyState) {
        _cubit.readyState();
      }
      if (state is UserLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is UserReadyState) {
        return const UserReadyScreen();
      }
      return const SizedBox.shrink();
    });
  }
}
