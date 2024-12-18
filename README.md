# Fresh Mart 🛒🥬

<p align="center">
  <img src="https://github.com/user-attachments/assets/873f7635-1986-4844-b627-a0f29eb0bf3e" alt="Image Description">
</p>

## 📱 Project Overview
Fresh Mart is a comprehensive Flutter-based grocery store mobile application that provides users with a seamless shopping experience. The app allows users to browse grocery items, manage their shopping cart, and complete purchases with ease.

## ✨ Features

- **Browse Grocery Items**: View a wide range of products with images and prices
- **Cart Management**: 
  - Add and remove items from the cart
  - Dynamic cart total calculation
  - Quantity adjustment for each item
- **Checkout Process**: 
  - Detailed customer information collection
  - Form validation
  - Order confirmation

## 🚀 Technical Highlights

- **State Management**: Implemented using Provider
- **Data Handling**: Local JSON-based product catalog
- **UI**: Material Design principles
- **Form Validation**: Comprehensive input checking

## 🛠 Installation

### Prerequisites
- Flutter SDK
- Dart SDK
- Android Studio or VS Code

### Steps
1. Clone the repository
```bash
https://github.com/Raashi-d/fresh_mart.git
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## 📦 Dependencies

- Flutter SDK
- Provider (State Management)
- Cupertino Icons

## 📋 Project Structure
```
fresh-mart/
│
├── lib/
│   ├── models/
│   │   └── grocery_item.dart
│   ├── providers/
│   │   ├── cart_provider.dart
│   │   └── grocery_provider.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── cart_screen.dart
│   │   └── checkout_screen.dart
│   └── main.dart
│
├── assets/
│   ├── grocery_items.json
│   └── images/
│
└── pubspec.yaml
```

## 🔧 Customization

- Modify `assets/grocery_items.json` to update product catalog
- Adjust theme in `main.dart` for custom styling
- Extend providers for additional functionality

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---

**Happy Shopping with Fresh Mart! 🥦🍎🛒**
