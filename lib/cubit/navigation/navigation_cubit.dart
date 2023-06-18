import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState>{
  NavigationCubit() : super(NavigationScenarioState());

  void pushToAuthorizationScene() => emit(NavigationAuthorizationState());
  void pushToRegistrationScene() => emit(NavigationRegistrationState());
  void pushToUserScene() => emit(NavigationUserState());
  void pushToTeamScene() => emit(NavigationTeamState());
  void pushToTeamListScene() => emit(NavigationTeamListState());
  void pushToTeamAddScene() => emit(NavigationTeamAddState());
  void pushToProjectAddScene() => emit(NavigationProjectAddState());
  void pushToProjectScene() => emit(NavigationProjectState());
  void pushToCharacterScene() => emit(NavigationCharacterState());
  void pushToAudioListScene() => emit(NavigationAudioListState());
  void pushToAudioPlayerScene() => emit(NavigationAudioPlayerState());
  void pushToScenarioScene() => emit(NavigationScenarioState());
}