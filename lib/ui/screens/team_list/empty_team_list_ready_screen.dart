import 'package:dw_front/cubit/navigation/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/team_list/cubit.dart';
import 'package:dw_front/ui/widgets/strider_drawer.dart';

class EmptyTeamListReadyScreen extends StatelessWidget {
  const EmptyTeamListReadyScreen({Key? key}) : super(key: key);

  // void setupPlaylist() async {
  //   ListView.builder(
  //     itemCount: 10, // здесь указываем количество элементов в списке
  //     itemBuilder: (BuildContext context, int index) {
  //       return ListTile(
  //         title: Text('Заголовок $index'),
  //         subtitle: Text('Подзаголовок $index'),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widget = List.generate(
      20,
      (index) => Container(
          // child: Text('my title is $index'),
          ),
    );
    return BlocBuilder<TeamListCubit, TeamListState>(builder: (context, state) {
      var _cubit = context.read<TeamListCubit>();
      if (state is TeamListEmptyState) {
        _cubit.readyState();
      }
      if (state is TeamListLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is TeamListReadyState) {
        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: PreferredSize(
              preferredSize: const Size.fromHeight(48.0),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Поиск…',
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: InputBorder.none,
                ),
                onChanged: (text) {
                  // handle search text changes
                },
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search_rounded, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  context.read<NavigationCubit>().pushToTeamAddScene();
                },
                icon: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
          drawer: const StriderDrawer(),
          body: Center(
            child: Column(
              children: [
                ColoredBox(
                  color: Colors.white,
                  child: Column(
                    children: const [
                      // ListTile(
                      //   leading: CircleAvatar(),
                      //   title: Text("Чупакабрик"),
                      //   subtitle: Text("Разница во времени"),
                      // ),
                      // Divider(),
                      // ListTile(
                      //   leading: CircleAvatar(),
                      //   title: Text("Название команды"),
                      //   subtitle: Text("Кол-во участников"),
                      // ),
                      // Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return const SizedBox.shrink();
    });
  }
}
