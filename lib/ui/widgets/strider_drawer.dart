import 'package:flutter/material.dart';

class StriderDrawer extends StatefulWidget {
  const StriderDrawer({Key? key}) : super(key: key);

  @override
  State<StriderDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<StriderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "User",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Профиль'),
          ),
          Divider(),
          ListTile(
            title: Text('Коллективы'),
          ),
          Divider(),
          ListTile(
            title: Text('Проекты'),
          ),
          Divider(),
          ListTile(
            title: Text('Аудиодорожки'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
