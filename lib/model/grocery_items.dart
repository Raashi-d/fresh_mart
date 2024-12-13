// Model class for grocery items
class GroceryItem {
  final int id;
  final String category;
  final String name;
  final double price;
  final String image;

  GroceryItem({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.image,
  });

  // Factory method to create a GroceryItem from JSON
  factory GroceryItem.fromJson(Map<String, dynamic> json) {
    return GroceryItem(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }
}
