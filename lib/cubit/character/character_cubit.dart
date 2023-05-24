import 'package:flutter_bloc/flutter_bloc.dart';
import 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterEmptyState());

  Future<void> readyState() async {
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(CharacterLoadingState()));
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(CharacterReadyState()));
    //login.text;
    //password.text;
  }
}
