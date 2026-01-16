# NotesApp - Flutter Aplication

<div align="center">
<url>
  <img src="https://lms.global.ac.id/lms/pluginfile.php/1/theme_klass/footerlogo/1745232397/logo-global-institute-stroke.png" alt="Institut Teknologi dan Bisnis Bina Sarana Global" width="200"/>
  </div>
<div align="center">
Institut Teknologi dan Bisnis Bina Sarana Global <br>
FAKULTAS TEKNOLOGI INFORMASI & KOMUNIKASI 
<br>
https://global.ac.id/
  </div>

  ##  Project UAS
  - Mata Kuliah : Aplikasi Mobile
  - Kelas : TI 23 M SE
  - Semester : GANJIL 
  - Tahun Akademik: 2025 - 2026

## About The Project
Notes App merupakan aplikasi mobile berbasis Flutter yang dirancang untuk membantu pengguna dalam melakukan pencatatan secara digital. Aplikasi ini dilengkapi dengan antarmuka yang sederhana dan mudah digunakan serta mendukung sinkronisasi data berbasis cloud melalui Firebase Authentication dan Cloud Firestore.

Aplikasi ini memungkinkan pengguna untuk menyimpan catatan secara pribadi maupun berbagi catatan dengan pengguna lain, sehingga mendukung aktivitas kolaboratif dalam pengelolaan informasi.

### Key Features
- **Modern UI/UX Design** – Antarmuka yang clean, responsif, dan user-friendly
- **User Authentication** – Login dan registrasi pengguna menggunakan Firebase Authentication
- **Personal Notes Management** – Membuat, mengedit, dan menghapus catatan pribadi
- **Collaborative Notes** – Berbagi catatan dengan pengguna lain untuk kolaborasi bersama
- **Push Notifications** – Reminder untuk catatan penting dan aktivitas tertentu
- **Cloud Sync** – Sinkronisasi data catatan secara otomatis menggunakan Cloud Firestore
- **Multi-Device Access** – Akses catatan dari berbagai perangkat dengan satu akun
- **Profile & Settings** – Pengelolaan profil pengguna dan preferensi aplikasi

## Screenshots
<div align="center">
1. Splash Screen & Authentication
  <img src="assets/images/board.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/splash1.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/splash2.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/splash3.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/splash4.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/login.png" alt="Splash Screen" width="200"/>

2.Fitur Aplikasi
  <img src="assets/images/homepage.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/members.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/workspace.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/addnote.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/notifikasi.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/profil.png" alt="Splash Screen" width="200"/>

  3.Team Developer
  <img src="assets/images/profilari.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/profilehelen.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/profilerian.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/profilmaria.png" alt="Splash Screen" width="200"/>
</div>

### Prerequisites
Pastikan Anda sudah menginstall:
- Flutter SDK (3.16.0 or higher)
- Dart SDK (3.2.0 or higher)
- Android Studio / VS Code
- Git

## Demo Video
Lihat video demo aplikasi kami untuk melihat semua fitur dalam aksi!
**[Watch Full Demo on YouTube](https://youtube.com/watch?v=dQw4w9WgXcQ)**
Alternative link: **[Google Drive Demo](https://drive.google.com/file/d/1234567890/view)**

## Built With
- **[Flutter](https://flutter.dev/)** - UI Framework
- **[Dart](https://dart.dev/)** - Programming Language
- **[Firebase](https://firebase.google.com/)** - Backend & Authentication
- **[Provider](https://pub.dev/packages/provider)** - State Management

### Installation
1. Clone repository
```bash
git clone https://github.com/yourusername/notes-app.git
cd notes-app
```

2. Install dependencies
```bash
flutter pub get
```

3. Setup Firebase
```bash
# Download google-services.json dari Firebase Console
# Place in android/app/
cp path/to/google-services.json android/app/
```

4. Run aplikasi
```bash
flutter run
```

### Build APK
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# Split APK by ABI
flutter build apk --split-per-abi
```
## Project Structure
```
lib/
├── main.dart
├── firebase_options.dart
│
├── models/                       #data (Note, User, dll)
│   └── note_model.dart
│
├── pages/                        #khusus UI / tampilan
│   ├── auth/
│   │   ├── login.dart
│   │   └── signup.dart
│   │
│   ├── home/
│   │   ├── homepage.dart
│   │   ├── members.dart
│   │   ├── notification_page.dart
│   │   ├── profile_ari.dart
│   │   ├── profile_helen.dart
│   │   ├── profile_maria.dart
│   │   └── profile_rian.dart
│   │
│   ├── notes/
│   │   └── add_notes.dart
│   │
│   ├── onboarding/
│   │   └── splashscreenboard.dart
│   │
│   ├── profile/
│   │   ├── profile.dart
│   │   └── edit_profile.dart
│   │
│   ├── splash/
│   │   ├── splashscreen1.dart
│   │   ├── splashscreen2.dart
│   │   ├── splashscreen3.dart
│   │   └── splashscreen4.dart
│   │
│   └── workspace/
│       └── workspace.dart
│
└── services/                         #Firebase, Notification, logic
    ├── fcm_background_handler.dart
    ├── fcm_notification_service.dart
    ├── image_service.dart
    ├── local_notification_service.dart
    └── notes_service.dart
```

## Authentication Flow
```
1. Onboarding Board
   - splashscreenboard.dart
        ↓
2. Splash Screen 1
   - splashscreen1.dart
        ↓
3. Splash Screen 2
   - splashscreen2.dart
        ↓
4. Splash Screen 3
   - splashscreen3.dart
        ↓
5. Splash Screen 4
   - splashscreen4.dart
        ↓
6. Auto Login Check
   - FirebaseAuth.currentUser
        ↓
7. Login / Register
   - login.dart
   - signup.dart
```
## Team Members & Contributions
### Development Team





