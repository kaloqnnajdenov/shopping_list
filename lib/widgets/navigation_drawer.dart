import 'package:shopping_list/services/auth_gate.dart';
import 'package:flutter/material.dart';


class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  //so that it is correctly aligned
  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          children: [
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const AuthGate()),
                  ); //TODO
                }),
            const ListTile(
              leading: const Icon(Icons.group),
              title: const Text("Groups"),
              //onTap: () {}, //TODO
            ),
            const ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              //onTap: () {}, //TODO
            ),
          ],
        ),
      );
}