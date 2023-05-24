import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserEmptyState());

  Future<void> readyState() async {
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(UserLoadingState()));
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(UserReadyState()));
    //login.text;
    //password.text;
  }
}
