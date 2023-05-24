import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_front/cubit/team_list/cubit.dart';
import 'package:dw_front/ui/widgets/strider_drawer.dart';

class TeamList extends StatelessWidget {
  const TeamList({Key? key}) : super(key: key);

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
            title: const Text("TeamList_profile"),
          ),
          drawer: const StriderDrawer(),
          body: Center(
            child: Column(
              children: [
                ColoredBox(
                  color: Colors.white,
                  child: Column(
                    children: const [
                      ListTile(
                        leading: CircleAvatar(),
                        title: Text("Чупакабрик"),
                        subtitle: Text("Разница во времени"),
                      ),
                      Divider(),
                      ListTile(
                        leading: CircleAvatar(),
                        title: Text("Название команды"),
                        subtitle: Text("Кол-во участников"),
                      ),
                      Divider(),
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
