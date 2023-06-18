import 'dart:convert';
import 'package:dw_front/data/api/team_list_content.dart';
import 'package:dw_front/data/models/small_team_model.dart';
import 'package:dw_front/data/temp_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'team_list_state.dart';

class TeamListCubit extends Cubit<TeamListState> {
  TeamListCubit() : super(TeamListEmptyState());

  late SmallTeamModel smallTeamModel;

  Future<void> readyState() async {
    Future.delayed(
        const Duration(milliseconds: 100), () => emit(TeamListLoadingState()));
    //await fill();
    Future.delayed(
        const Duration(milliseconds: 100), () => emit(TeamListReadyState()));
  }

  Future<void> fill() async {
    var response = await TeamListContent.teamlist();
    if (response.statusCode < 300) {
      //smallTeamModel = SmallTeamModel.fromJson(jsonDecode(response.body));
    } else {
      Fluttertoast.showToast(msg: "Ты еблан!");
    }
  }
}
