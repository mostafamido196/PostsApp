# **Flutter List & Detail Screen App**

## Features
- List of items with a search functionality
- Loading state and error handling
- Item details screen with a clean and modern UI
- GetX for state management
- Responsive UI for different screen sizes

## Screenshots
![11](https://github.com/user-attachments/assets/830fb96d-ec04-4ee0-9589-34db899d219e)
![22](https://github.com/user-attachments/assets/793358a1-f122-4c6f-b594-b97775ca956a)
![33](https://github.com/user-attachments/assets/04005246-e8c4-426c-abca-3db00095075d)
![44](https://github.com/user-attachments/assets/7afdf495-5fb5-4c09-ac55-7a0d0f55ad3e)


## Installation

### Prerequisites
Ensure that you have the following installed:
- Flutter (2.x or higher)
- Dart
- A code editor like Visual Studio Code or Android Studio

### Clone the Repository
Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/flutter-list-detail-app.git
```

### Install Dependencies
Navigate to the project directory and install the dependencies:

```bash
cd flutter-list-detail-app
flutter pub get
```

### Run the App
To run the app, use the following command:

```bash
flutter run
```

Make sure to select a target device (Android, iOS, or emulator) before running the app.

## Architecture
This app follows the MVVM and Clean Architecture principles. The main layers are:
- **Presentation Layer**: Contains the UI and handles the display logic
- **Domain Layer**: Contains business logic and use cases
- **Data Layer**: Handles data fetching and provides repositories for use cases

## Folder Structure
```
lib/
├── core/
│   ├── error/
│   │   ├── components/
│   │   │   ├── error_widget.dart
│   │   │   └── loading_widget.dart
├── features/
│   ├── detail_screen/
│   │   ├── controllers/
│   │   │   └── detail_controller.dart
│   │   ├── presentation/
│   │   │   └── pages/
│   │   │       └── detail_page.dart
│   ├── list_screen/
│   │   ├── controllers/
│   │   │   └── list_controller.dart
│   │   ├── presentation/
│   │   │   └── pages/
│   │   │       └── list_page.dart
├── main.dart
└── routes.dart
```

### core/
Contains components shared across the app, like loading and error handling widgets.

### features/
Contains the feature-specific logic:
- **list_screen**: Handles the list of items and search functionality
- **detail_screen**: Displays the details of a selected item

## Dependencies
The following dependencies are used in the project:
- `flutter`: Flutter SDK for building the app
- `get`: State management and route handling
- `http`: For making HTTP requests
- `flutter_riverpod`: If using any other dependencies for state management (optional)

Add any other dependencies your project requires.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Customizations
- Replace `your-username` in the clone command with your actual GitHub username or project URL
- Add screenshots if available to make the README more visually appealing
