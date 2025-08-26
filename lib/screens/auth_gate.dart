import 'package:shopping_list/screens/login_page.dart';
import 'package:shopping_list/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        //if there is an active session

        final session = snapshot.hasData? snapshot.data!.session : null;
        if(session != null) {
          return const RegisterPage();
        }else {
          return const LoginPage();
        }
      },
    );
  }
}
