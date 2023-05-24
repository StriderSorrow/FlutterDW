import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/team/cubit.dart';
import 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  TeamCubit() : super(TeamEmptyState());


  Future<void> readyState() async {
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(TeamLoadingState()));
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(TeamReadyState()));
    //login.text;
    //password.text;
  }
}
