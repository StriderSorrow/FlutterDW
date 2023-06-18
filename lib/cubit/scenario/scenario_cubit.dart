import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'scenario_state.dart';

class ScenarioCubit extends Cubit<ScenarioState> {
  ScenarioCubit() : super(ScenarioEmptyState());

  final TextEditingController start = TextEditingController();
  final TextEditingController end = TextEditingController();
  final TextEditingController character = TextEditingController();
  final TextEditingController originalText = TextEditingController();
  final TextEditingController translatedText = TextEditingController();

  Future<void> readyState() async {
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(ScenarioLoadingState()));
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(ScenarioReadyState()));
    //login.text;
    //password.text;
  }
}
