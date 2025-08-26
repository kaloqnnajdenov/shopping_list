
import 'package:shopping_list/screens/register_page.dart';
import 'package:shopping_list/services/auth_services.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //get Auth service
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    //attempt login
    try{
      await authService.signInWithEmailPassword(email, password);
    }catch (e) {
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextField(controller: _emailController,),
          TextField(controller: _passwordController,),  
          ElevatedButton(onPressed: login, child: const Text("Login")),
          GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage(),)),
          child: const Center(child: Text("Dont have a profile? Sign Up!"),),)
        ],
      ),
    );
  }
}

