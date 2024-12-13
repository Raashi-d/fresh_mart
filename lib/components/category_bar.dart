import 'package:flutter/material.dart';

// Custom Category Bar Widget
class CategoryBar extends StatefulWidget {
  final Function(String) onCategorySelected;
  final String selectedCategory;

  const CategoryBar({
    Key? key,
    required this.onCategorySelected,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.grey[300], // Background for the bar
      ),
      child: Stack(
        children: [
          // Highlighted bar
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: widget.selectedCategory == 'Fruits'
                ? 0
                : MediaQuery.of(context).size.width / 2,
            width: MediaQuery.of(context).size.width / 2,
            height: 50.0,
            child: Container(
              color: Colors.green,
            ),
          ),
          // Row for the categories
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.onCategorySelected('Fruits');
                  },
                  child: Center(
                    child: Text(
                      'Fruits',
                      style: TextStyle(
                        color: widget.selectedCategory == 'Fruits'
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.onCategorySelected('Vegetables');
                  },
                  child: Center(
                    child: Text(
                      'Vegetables',
                      style: TextStyle(
                        color: widget.selectedCategory == 'Vegetables'
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
