# Flutter Collections UI

A simple and elegant Flutter application that displays expandable collection cards with image galleries. This project demonstrates core Flutter concepts including stateful widgets, ListView builders, and responsive UI design.

## 📱 Features

- **Expandable Collection Cards**: Tap any collection to expand/collapse it
- **Horizontal Image Gallery**: Each collection displays a scrollable row of images
- **Image Preview Counter**: Shows remaining images with a "+N" overlay on the last visible image
- **Responsive Design**: Clean, modern UI with smooth animations
- **Error Handling**: Graceful loading states and error handling for network images

## 🎯 Approach

### Architecture

The application follows a simple, component-based architecture using Flutter's widget system:

1. **Main App Structure**: Uses `MaterialApp` with Material 3 theming for a modern look
2. **Stateless Container**: `SimpleUI` serves as the main scaffold with an AppBar and ListView
3. **Stateful Components**: `CollectionCard` manages its own expansion state independently
4. **Separation of Concerns**: UI logic is separated into focused, reusable widgets

### Key Design Decisions

- **State Management**: Local state using `StatefulWidget` - simple and sufficient for this use case
- **List Generation**: Dynamic rendering using `ListView.builder` for efficient memory usage
- **Image Loading**: Network images with loading indicators and error fallbacks
- **Visual Feedback**: Icons change based on expansion state for better UX

## 📂 Project Structure

```
flutter_collections_ui/
│
├── lib/
│   └── main.dart              # Complete application code
│
├── pubspec.yaml               # Project dependencies
├── README.md                  # This file
└── android/                   # Android platform files
└── ios/                       # iOS platform files
```

### Code Organization (main.dart)

```
main.dart
├── main()                     # App entry point
├── SimpleUI                   # Main scaffold (StatelessWidget)
│   └── ListView.builder       # Renders list of collections
│
└── CollectionCard             # Individual collection (StatefulWidget)
    ├── _isExpanded            # Local expansion state
    ├── build()                # Main card layout
    ├── _buildImage()          # Image widget with loading/error states
    └── _buildOverlay()        # "+N" overlay for remaining images
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher recommended)
- Dart SDK (included with Flutter)
- Android Studio / Xcode (for mobile deployment)
- Any IDE (VS Code, Android Studio, IntelliJ IDEA)

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repository-url>
   cd flutter_collections_ui
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

   Or for web:
   ```bash
   flutter run -d chrome
   ```

### Building the Project

**For Android:**
```bash
flutter build apk
```

**For iOS:**
```bash
flutter build ios
```

**For Web:**
```bash
flutter build web
```

## 🛠️ Technical Implementation

### Stateful Widget Pattern

The `CollectionCard` uses Flutter's stateful widget pattern to manage expansion state:

```dart
bool _isExpanded = false;

onTap: () => setState(() => _isExpanded = !_isExpanded)
```

### Image Loading with Feedback

Images include three states for better UX:
- **Loading**: Displays a circular progress indicator
- **Success**: Shows the loaded image
- **Error**: Shows a broken image icon

### Dynamic Content Calculation

The overlay shows remaining images dynamically:
```dart
final remaining = totalImages - previewCount;
if (isLast && remaining > 0) _buildOverlay("+$remaining")
```

## 🎨 Customization

You can easily customize the following parameters in `_CollectionCardState`:

- `totalImages`: Total number of images per collection (default: 6)
- `previewCount`: Number of visible images before "+N" overlay (default: 4)
- Card colors: Modify `Color(0xFFF2F2F2)` in the container decoration
- Image dimensions: Adjust width/height in `_buildImage()` method
- Number of collections: Change `itemCount` in `ListView.builder` (default: 10)

## 📋 Dependencies

This project uses only Flutter's core packages:

```yaml
dependencies:
  flutter:
    sdk: flutter
```

No additional third-party packages are required, making it lightweight and easy to maintain.

## 🔧 Configuration

The project works out of the box with **no additional configuration required**. Simply run `flutter pub get` and `flutter run`.

### Internet Permissions

For Android, internet permission is already configured in `AndroidManifest.xml` (Flutter's default). For iOS, no additional configuration is needed for HTTP requests.

## 📱 Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 📄 License

This project is open source and available under the MIT License.

## 👤 Author

Created as a demonstration of Flutter UI development best practices.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## 📞 Support

If you encounter any issues:
1. Ensure Flutter is properly installed: `flutter doctor`
2. Clear build cache: `flutter clean && flutter pub get`
3. Check for Flutter/Dart version compatibility

---

**Note**: This project uses placeholder images from picsum.photos. Ensure you have an active internet connection when running the app.