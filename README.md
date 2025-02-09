# NFC Card Scanner App

This Flutter app allows users to scan NFC cards and simulate card interactions in environments without NFC support. The app follows the MVVM architecture and integrates Firebase Firestore for real-time data storage.

## Features
- **NFC Card Scanning:** Tap NFC cards to read and store data.
- **Simulated Card Mode:** For devices without NFC, tap or long-press a card to simulate interactions.
- **Data Storage:** All interactions are stored in Firebase Firestore.

## Requirements
- Flutter SDK
- Android/iOS device with NFC support 
- Firebase account with Firestore enabled

## App Screenshots

### Tap Screen
![Tap Screen](assets/screenshots/WhatsApp%20Image%202025-02-09%20at%209.17.22%20PM.jpeg)

### NFC Data Processed Screen
![Submit Snackbar](assets/screenshots/WhatsApp%20Image%202025-02-09%20at%209.17.22%20PM%20(1).jpeg)

### History Screen
![History Screen](assets/screenshots/WhatsApp%20Image%202025-02-09%20at%209.17.22%20PM%20(2).jpeg)

### Firestore Screen
![History Screen](assets/screenshots/Screenshot%202025-02-09%20212957.png)


## Directory Structure
```
├── lib
│   ├── main.dart             # Entry point of the app
│   ├── views                  # UI screens
│   ├── viewmodels             # Business logic
│   └── services               # Service integrations
├── pubspec.yaml               # Project configuration
```

## Contact
contact: [tushark200154@gmail.com]

---

