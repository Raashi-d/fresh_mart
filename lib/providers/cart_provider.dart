import 'package:flutter/foundation.dart';
import 'package:fresh_mart/model/grocery_items.dart';

class CartProvider with ChangeNotifier {
  final List<GroceryItem> _items = [];
  final Map<int, int> _itemQuantities = {};

  List<GroceryItem> get items => _items;

  int getQuantity(GroceryItem item) {
    return _itemQuantities[item.id] ?? 0;
  }

  void addToCart(GroceryItem item) {
    if (!_items.contains(item)) {
      _items.add(item);
    }
    _itemQuantities[item.id] = (_itemQuantities[item.id] ?? 0) + 1;
    notifyListeners();
  }

  void removeFromCart(GroceryItem item) {
    if (_itemQuantities[item.id] != null && _itemQuantities[item.id]! > 1) {
      _itemQuantities[item.id] = _itemQuantities[item.id]! - 1;
    } else {
      _items.remove(item);
      _itemQuantities.remove(item.id);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _itemQuantities.clear();
    notifyListeners();
  }

  double getTotalPrice() {
    return _items.fold(
        0.0,
        (total, item) =>
            total + (item.price * (_itemQuantities[item.id] ?? 0)));
  }
}
