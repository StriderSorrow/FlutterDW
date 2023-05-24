import 'package:flutter_bloc/flutter_bloc.dart';
import 'track_list_state.dart';

class TrackListCubit extends Cubit<TrackListState> {
  TrackListCubit() : super(TrackListEmptyState());

  Future<void> readyState() async {
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(TrackListLoadingState()));
    Future.delayed(const Duration(milliseconds: 100),
        () => emit(TrackListReadyState()));
    //login.text;
    //password.text;
  }
}
