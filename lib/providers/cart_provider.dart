import 'package:flutter/foundation.dart';
import 'package:fresh_mart/model/grocery_items.dart';

// Provider class to manage cart items
class CartProvider with ChangeNotifier {
  final List<GroceryItem> _items = [];
  final Map<int, int> _itemQuantities = {};

  // Getter to access the list of cart items
  List<GroceryItem> get items => _items;

  // Method to get the quantity of a specific item in the cart
  int getQuantity(GroceryItem item) {
    return _itemQuantities[item.id] ?? 0;
  }

  // Method to add an item to the cart
  void addToCart(GroceryItem item) {
    if (!_items.contains(item)) {
      _items.add(item);
    }
    _itemQuantities[item.id] = (_itemQuantities[item.id] ?? 0) + 1;
    notifyListeners(); 
  }

  // Method to remove an item from the cart
  void removeFromCart(GroceryItem item) {
    if (_itemQuantities[item.id] != null && _itemQuantities[item.id]! > 1) {
      _itemQuantities[item.id] = _itemQuantities[item.id]! - 1;
    } else {
      _items.remove(item);
      _itemQuantities.remove(item.id);
    }
    notifyListeners();
  }

  // Method to clear all items from the cart
  void clearCart() {
    _items.clear();
    _itemQuantities.clear();
    notifyListeners(); 
  }

  // Method to calculate the total price of items in the cart
  double getTotalPrice() {
    return _items.fold(
        0.0,
        (total, item) =>
            total + (item.price * (_itemQuantities[item.id] ?? 0)));
  }
}
