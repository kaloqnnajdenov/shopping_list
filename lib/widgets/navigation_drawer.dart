import 'package:shopping_list/screens/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/screens/login_page.dart';
import 'package:shopping_list/screens/profile_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


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
    runSpacing: 12,
    children: [
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text("Profile"),
        onTap: () {
          // Close drawer first (if inside a Drawer)
          Navigator.pop(context);

          final session = Supabase.instance.client.auth.currentSession;
          if (session != null) {
            // Already logged in -> go to Profile details
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfilePage()),
            );
          } else {
            // Not logged in -> go to your existing AuthGate
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AuthGate()),
            );
          }
        },
      ),
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