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
### Splash Screen & Authentication
<div align="center">
  <img src="assets/images/board.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/splash1.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/splash2.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/splash3.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/splash4.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/login.png" alt="Splash Screen" width="200"/>
</div>

### Fitur Aplikasi
<div align="center">
  <img src="assets/images/homepage.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/members.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/workspace.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/addnote.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/notifikasi.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/profil.png" alt="Splash Screen" width="200"/>
</div>

### Team Developer
<div align="center">
  <img src="assets/images/profilari.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/profilehelen.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/profilerian.png" alt="Splash Screen" width="200"/>
  <img src="assets/images/profilmaria.png" alt="Splash Screen" width="200"/>
</div>

## Demo Video
Lihat video demo aplikasi kami untuk melihat semua fitur dalam aksi!
**[Watch Full Demo on YouTube](https://youtube.com/watch?v=dQw4w9WgXcQ)**
Alternative link: **[Google Drive Demo](https://drive.google.com/file/d/1234567890/view)**

## Built With
- **[Flutter](https://flutter.dev/)** - UI Framework
- **[Dart](https://dart.dev/)** - Programming Language
- **[Firebase](https://firebase.google.com/)** - Backend & Authentication
- **[Provider](https://pub.dev/packages/provider)** - State Management


## Getting Started

### Prerequisites
Pastikan Anda sudah menginstall:
- Flutter SDK (3.16.0 or higher)
- Dart SDK (3.2.0 or higher)
- Android Studio / VS Code
- Git

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

## 📁Project Structure
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
## 📝 API & Services Integration

### Firebase Authentication
- Google Sign-In: Menggunakan firebase_auth dan auth_service.dart.
- Session Manager: Mengelola sesi pengguna secara lokal.

### Firebase Database
- CRUD Operations: Mengakses notes dan archive_categories melalui firestore_service.dart.

### Development Workflow
1. Fork repository
2. Create feature branch (`git checkout -b feature/NewFeature`)
3. Commit changes (`git commit -m 'Add some NewFeature'`)
4. Push to branch (`git push origin feature/NewFeature`)
5. Open Pull Request


## Team Members & Contributions
### Development Team
| Name | Role | Contributions |
|------|------|---------------|
| **Helen** | UI/UX & Backend Developer | - Perancangan UI/UX aplikasi<br>- Sistem autentikasi (Login & Register)<br>- Integrasi Firebase<br>- Pengembangan API<br>- Desain dan manajemen database |
| **Rian61** | Full Stack Developer| - Membuat notifikasi dan workspace  |
| **Ari** | Frontend Developer | - Membuat Tampilan Member dan Homepage |
| **Maria** | Frontend Developer | - Mebuat Tampilan profile page dan add notes |

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
- [Flutter Community](https://flutter.dev/community) - For amazing packages
- [Firebase](https://firebase.google.com/) - For backend services
- [Flaticon](https://www.flaticon.com/) - For app icons
- [Unsplash](https://unsplash.com/) - For placeholder images


---

<div align="center">
  <p>Made with by NPC Team</p>
  <p>© 2026 Notes App. All rights reserved.</p>
</div>




