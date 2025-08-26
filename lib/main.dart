import 'package:shopping_list/screens/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/shopping_list_page.dart';

void main() async {
  await Supabase.initialize(
      url: "https://igzqbpflamkalybgdlcl.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlnenFicGZsYW1rYWx5YmdkbGNsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYwMzEzNDksImV4cCI6MjA3MTYwNzM0OX0.1UqHT9yVcLqy7yPA4MohCbC2pHWZLjmzrMjOAng3pHI");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buy List',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeNav(),
    );
  }
}

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _index = 0;

  final _pages = const [
    ShoppingListPage(),
    AuthGate(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _pages[_index]);
  }
}