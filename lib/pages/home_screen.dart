import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/grocery_provider.dart';
import 'package:fresh_mart/components/category_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'Fruits';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GroceryProvider>(context, listen: false).loadGroceryItems();
    });
  }

  // Function to handle category selection
  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fresh Mart',
          style: GoogleFonts.anton(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.8),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search items...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
            const SizedBox(
                height: 10.0),

            // Custom Category Bar
            CategoryBar(
              selectedCategory: _selectedCategory,
              onCategorySelected: _onCategorySelected,
            ),

            const SizedBox(height: 10.0), 

            // GridView Builder with Filter
            Expanded(
              child: Consumer<GroceryProvider>(
                builder: (context, groceryProvider, child) {
                  final filteredItems = groceryProvider.items.where((item) {
                    return item.category == _selectedCategory &&
                        item.name.toLowerCase().contains(_searchQuery);
                  }).toList();

                  return filteredItems.isEmpty
                      ? const Center(child: Text('No items found!'))
                      : LayoutBuilder(
                          builder: (context, constraints) {
                            double itemWidth = constraints.maxWidth / 2 - 12;
                            double itemHeight = itemWidth * 1.5;
                            double childAspectRatio = itemWidth / itemHeight;

                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: childAspectRatio,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: filteredItems.length,
                              itemBuilder: (context, index) {
                                final item = filteredItems[index];
                                return Card(
                                  elevation: 4.0,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                        child: Image.asset(
                                          'assets/${item.image}',
                                          height: 130,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            const SizedBox(height: 4.0),
                                            Text(
                                              'Rs. ${item.price.toStringAsFixed(2)}',
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Handle "Add to Cart" action.
                                          },
                                          style: ElevatedButton.styleFrom(
                                            minimumSize:
                                                const Size.fromHeight(36),
                                          ),
                                          child: const Text('Add to Cart'),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
