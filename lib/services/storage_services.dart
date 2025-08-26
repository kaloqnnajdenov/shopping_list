import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final _key = 'shopping_items';

  Future<List<String>> loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? <String>[];
  }

  Future<void> saveItems(List<String> items) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, items);
  }
}