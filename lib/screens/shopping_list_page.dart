import 'package:shopping_list/widgets/dismissable_item_dialog.dart';
import 'package:flutter/material.dart';
import '../services/storage_services.dart';
import '../widgets/add_item_dialog.dart';
import '../widgets/navigation_drawer.dart' as navDrawer;  
class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final _storage = StorageService();
  List<String> _items = <String>[];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    _items = await _storage.loadItems();
    setState(() {});
  }

  Future<void> _saveItems() async => _storage.saveItems(_items);

  // ─── page-level helpers ──────────────────────────────────────────────────────
  void _addItem(String text) {
    setState(() => _items.add(text));
    _saveItems();
  }

  void _removeItem(int index) {
    setState(() => _items.removeAt(index));
    _saveItems();
  }

  void _openAddDialog() {
    showDialog(
      context: context,
      builder: (_) => AddItemDialog(onSave: _addItem),
    );
  }

  // ─── UI ──────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: _openAddDialog),
        ],
      ),
      drawer: const navDrawer.NavigationDrawer(),
      body: _items.isEmpty
          ? const Center(child: Text('Tap + to add your first item'))
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (_, i) => DismissibleItem(
                key: ValueKey(_items[i]),
                text: _items[i],
                onDismissed: () => _removeItem(i),
              ),
            ),
    );
  }
}