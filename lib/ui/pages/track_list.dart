// import 'package:just_audio/just_audio.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:dw_front/ui/widgets/seek_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dw_front/cubit/track_list/cubit.dart';
// import 'package:dw_front/ui/widgets/strider_drawer.dart';
//
// import '../widgets/text_button.dart';
//
// class TrackList extends StatelessWidget {
//   const TrackList({Key? key}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TrackListCubit, TrackListState>(
//         builder: (context, state) {
//       var _cubit = context.read<TrackListCubit>();
//       if (state is TrackListEmptyState) {
//         _cubit.readyState();
//       }
//       if (state is TrackListLoadingState) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//       if (state is TrackListReadyState) {
//         return Scaffold(
//           backgroundColor: Colors.grey,
//           appBar: AppBar(
//             title: const Text("TrackList_profile"),
//           ),
//           drawer: const StriderDrawer(),
//           bottomNavigationBar: BottomNavigationBar(
//             items: const [
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.house), label: "Homepage"),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.email_outlined), label: "Mail")
//             ],
//           ),
//           body: Center(
//             child: Column(
//               children: [
//                 ColoredBox(
//                   color: Colors.white,
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Column(
//                       children: [],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }
//       return const SizedBox.shrink();
//     });
//   }
// }
