import 'package:dw_front/cubit/navigation/cubit.dart';
import 'package:dw_front/cubit/scenario/cubit.dart';
import 'package:dw_front/ui/screens/scenario/scenario_ready_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Scenario extends StatelessWidget {
  const Scenario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScenarioCubit, ScenarioState>(builder: (context, state) {
      var _cubit = context.read<ScenarioCubit>();
      if (state is ScenarioEmptyState) {
        _cubit.readyState();
      }
      if (state is ScenarioLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ScenarioReadyState) {
        return ScenarioReadyScreen();
      }
      return const SizedBox.shrink();
    });
  }
}
