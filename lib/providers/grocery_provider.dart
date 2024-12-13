import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fresh_mart/model/grocery_items.dart';

// Provider class to manage grocery items
class GroceryProvider with ChangeNotifier {
  List<GroceryItem> _items = [];

  // Getter to access the list of grocery items
  List<GroceryItem> get items => _items;

  // Method to load grocery items from a JSON file
  Future<void> loadGroceryItems() async {
    final String jsonString =
        await rootBundle.loadString('assets/grocery_items.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    _items = jsonList.map((json) => GroceryItem.fromJson(json)).toList();
    notifyListeners(); 
  }
}
