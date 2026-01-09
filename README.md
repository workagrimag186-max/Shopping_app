🛒 Premium Shopping App
A high-performance E-commerce mobile application built with Flutter and Firebase. This app features a complete authentication system, real-time product browsing, and a dynamic shopping cart.


✨ Key Features
User Authentication: Secure Login and Sign-up using Firebase Auth.

Product Discovery: Fetches live product data from a REST API.

Search Functionality: Real-time filtering to find products instantly.

Cart Management: Add, remove, and manage item quantities using the Provider package.

Persistent State: Global state management to keep the UI synced across screens.


🛠️ Tech Stack
Frontend: Flutter & Dart

Backend: Firebase (Authentication & Core)

State Management: Provider

API: FakeStoreAPI (for product data)


🚀 Setup Instructions
Follow these steps to run the project locally:

1. Prerequisites
Install Flutter SDK

Install Firebase CLI

2. Clone the Project
Bash

git clone https://github.com/workagrimag186-max/Shopping_app.git
cd Shopping_app
3. Install Dependencies

* flutter pub get

4. Configure Firebase
Since the google-services.json and firebase_options.dart are unique to each environment, you must initialize your own Firebase project:
* firebase login
* flutterfire configure
Select your Firebase project and platforms (Android/iOS/Web).

5. Run the App
* flutter run

📁 Project Structure
lib/providers/: Contains Auth and Cart logic.

lib/screens/: UI screens (Login, Home, Cart).

lib/models/: Data structures for Products and Cart Items.

lib/main.dart: Entry point with Firebase initialization.

<img width="391" height="805" alt="image" src="https://github.com/user-attachments/assets/c6d20540-4791-4cd8-8b6d-55835a1a216f" />

<img width="398" height="812" alt="image" src="https://github.com/user-attachments/assets/975573dd-ed23-4492-ba9d-40b3199e9cc6" />

<img width="393" height="801" alt="image" src="https://github.com/user-attachments/assets/c3aa13c5-b3d5-4366-bcfa-25b39b57a8c5" />

<img width="388" height="795" alt="image" src="https://github.com/user-attachments/assets/47712cfb-15a5-4b51-a702-1504c1b44dd4" />

<img width="393" height="797" alt="image" src="https://github.com/user-attachments/assets/7de1def0-e8c1-48be-ab74-aae7e5b222be" />

<img width="389" height="796" alt="image" src="https://github.com/user-attachments/assets/e3b186ba-e993-4f3b-bb8b-e076287fe48f" />

<img width="397" height="813" alt="image" src="https://github.com/user-attachments/assets/66e1436c-708e-4296-a2a7-0831f157e339" />

<img width="400" height="805" alt="image" src="https://github.com/user-attachments/assets/425473eb-b31d-44ed-8d4d-a2cdf43211f0" />

<img width="394" height="793" alt="image" src="https://github.com/user-attachments/assets/7ab9b1c3-44dd-49e8-90a6-7633375753fb" />

<img width="392" height="799" alt="image" src="https://github.com/user-attachments/assets/a4966d7a-7aee-4a31-b695-96f550487d15" />
