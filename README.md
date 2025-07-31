# Flutter Todo List Application

A modern, cross-platform Todo list application built with Flutter that helps users manage their daily tasks efficiently. This application features user authentication, secure token-based sessions, and a clean, intuitive interface for task management.

## 🎯 Project Overview

This Flutter Todo application is designed to provide users with a seamless task management experience. It combines modern UI design with robust functionality, including user registration, secure login, and comprehensive todo management capabilities.

## ✨ Key Features

### 🔐 Authentication & Security
- **User Registration**: Create new accounts with email and password
- **Secure Login**: JWT-based authentication system
- **Session Management**: Automatic token validation and persistence
- **Logout Functionality**: Secure session termination

### 📝 Todo Management
- **Add Tasks**: Create new todo items with a simple dialog interface
- **View Tasks**: Display all tasks in a clean, organized list
- **Delete Tasks**: Swipe-to-delete functionality with confirmation
- **Task Counter**: Real-time display of total number of tasks
- **Persistent Storage**: Tasks are saved and synchronized with backend

### 🎨 User Interface
- **Modern Design**: Clean, gradient-based UI with Material Design principles
- **Responsive Layout**: Adapts to different screen sizes and orientations
- **Interactive Elements**: Smooth animations and intuitive gestures
- **Random App Icons**: Dynamic logo display from a collection of assets
- **Floating Action Button**: Quick access to add new tasks

## 🛠️ Technologies & Dependencies

### Frontend (Flutter)
- **Flutter**: Cross-platform UI framework (SDK >=3.2.0)
- **Dart**: Programming language
- **velocity_x**: Utility library for Flutter development
- **http**: HTTP client for API communication
- **shared_preferences**: Local data persistence
- **jwt_decoder**: JWT token validation and decoding
- **flutter_slidable**: Swipe-to-delete functionality

### Backend (Node.js)
- **Node.js**: JavaScript runtime environment
- **Express.js**: Web application framework
- **MongoDB**: NoSQL database
- **JWT**: JSON Web Token authentication
- **Mongoose**: MongoDB object modeling
- **bcrypt**: Password hashing
- **cors**: Cross-origin resource sharing

## 📱 Supported Platforms

- **Android**: Native Android application
- **iOS**: Native iOS application
- **Web**: Progressive Web App (PWA)
- **Desktop**: Windows, macOS, and Linux support

## 🚀 Installation & Setup

### Prerequisites
- Flutter SDK (>=3.2.0)
- Dart SDK
- Node.js (>=14.0.0)
- MongoDB (local installation or MongoDB Atlas)
- Android Studio / VS Code
- Git

### Backend Requirements
- Node.js backend server running on `http://localhost:3000`
- MongoDB database
- JWT authentication endpoints

**Backend Repository**: [nodejs_TodoList](https://github.com/jozefelmanga/nodejs_TodoList.git)

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd flutter_TodoList
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Setup Backend Server**
   ```bash
   # Clone the backend repository
   git clone https://github.com/jozefelmanga/nodejs_TodoList.git
   cd nodejs_TodoList
   
   # Install backend dependencies
   npm install
   
   # Configure environment variables (create .env file)
   # Add your MongoDB connection string and JWT secret
   
   # Start the backend server
   npm start
   ```
   
   The backend server should be running on `http://localhost:3000` with the following endpoints:
   - `POST /api/users/register` - User registration
   - `POST /api/users/login` - User authentication
   - `GET /api/todos` - Fetch todos
   - `POST /api/todos` - Create todo
   - `DELETE /api/todos/:id` - Delete todo

4. **Run the Application**
   ```bash
   flutter run
   ```

## 📖 Usage Guide

### Getting Started
1. **Launch the App**: Open the application on your device
2. **Create Account**: Tap "Create a new Account" to register
3. **Sign In**: Use your credentials to log in
4. **Start Managing Tasks**: Begin adding and organizing your todos

### Managing Tasks
- **Add Task**: Tap the floating action button (+) to add a new task
- **View Tasks**: All tasks are displayed in the main list
- **Delete Task**: Swipe left on any task to reveal the delete option
- **Task Count**: View the total number of tasks at the top of the screen

### Account Management
- **Logout**: Tap the logout icon in the app bar to sign out
- **Session Persistence**: The app remembers your login session
- **Automatic Redirect**: Logged-in users are automatically taken to the dashboard

## 🏗️ Project Structure

### Frontend (Flutter)
```
lib/
├── main.dart              # Application entry point
├── config.dart            # API configuration and endpoints
├── loginPage.dart         # User authentication interface
├── registration.dart      # User registration interface
├── dashboard.dart         # Main todo management interface
└── applogo.dart          # Dynamic logo component

assets/
├── enjoy.png             # App logo assets
├── fix.png
├── learn.png
├── pc.png
└── girl.png
```

### Backend (Node.js)
```
nodejs_TodoList/
├── app.js                 # Main application file
├── package.json           # Dependencies and scripts
├── config/                # Database configuration
├── controllers/           # Request handlers
├── middlewares/           # Custom middleware
├── models/                # Database models
├── routes/                # API route definitions
├── services/              # Business logic
└── .env                   # Environment variables
```

## 🔧 Configuration

### API Endpoints
The application is configured to connect to a local backend server. Update the `config.dart` file to modify API endpoints:

```dart
final url = 'http://localhost:3000/';
final registration = url + "api/users/register";
final login = url + 'api/users/login';
final apiTodos = url + 'api/todos';
```

### Environment Setup
- **Development**: Uses localhost for backend communication
- **Production**: Update URLs to production server endpoints
- **Testing**: Configure test endpoints as needed

## 🧪 Testing

Run the test suite to ensure application functionality:

```bash
flutter test
```

## 📦 Building for Production

### Android APK
```bash
flutter build apk --release
```

### iOS App Bundle
```bash
flutter build ios --release
```

### Web Build
```bash
flutter build web --release
```

## 🔗 Related Repositories

- **Frontend**: This Flutter application
- **Backend**: [nodejs_TodoList](https://github.com/jozefelmanga/nodejs_TodoList.git) - Node.js Express server with MongoDB

---

**Note**: This application requires a running backend server to function properly. Ensure your backend is configured and running before testing the application.
