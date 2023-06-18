import 'package:dw_front/ui/screens/registration/registration_confirm_screen.dart';
import 'package:dw_front/ui/screens/registration/registration_ready_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/registration/cubit.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
      var _cubit = context.read<RegistrationCubit>();
      if (state is RegistrationEmptyState) {
        _cubit.readyState();
      }
      if (state is RegistrationLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is RegistrationReadyState) {
        return const RegistrationReadyScreen();
      }
      if (state is RegistrationConfirmState) {
        return const RegistrationConfirmScreen();
      }
      return const SizedBox.shrink();
    });
  }
}
