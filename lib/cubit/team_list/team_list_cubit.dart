import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'team_list_state.dart';

class TeamListCubit extends Cubit<TeamListState> {
  TeamListCubit() : super(TeamListEmptyState());

 //final List<AutofillGroup> x;

  Future<void> readyState() async {
    Future.delayed(const Duration(milliseconds: 100),
            () => emit(TeamListLoadingState()));
    Future.delayed(const Duration(milliseconds: 100),
            () => emit(TeamListReadyState()));
    //login.text;
    //password.text;
  }
}
