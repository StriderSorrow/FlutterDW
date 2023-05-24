import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState>{
  NavigationCubit() : super(NavigationRegistrationState());

  void pushToAuthorizationScene() => emit(NavigationAuthorizationState());
  void pushToRegistrationScene() => emit(NavigationRegistrationState());
  void pushToUserScene() => emit(NavigationUserState());
  void pushToTeamScene() => emit(NavigationTeamState());
  void pushToProjectScene() => emit(NavigationProjectState());
  void pushToCharacterScene() => emit(NavigationCharacterState());
  //void pushToTrackListScene() => emit(NavigationTrackListState());
}