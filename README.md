# Shift - Aplikasi Presensi Pegawai 
> 🚧 This project is not completed

This application is showcasing

- MVS (Model, View, Service)
- QR code scanner
- GPS to locate current position



## How to Run The App (Local)

### Requirements

- Flutter: ^3.13
- Dart: ^3.1
- Android Studio / Xcode
- Backend API running -> see https://github.com/ghufr/attendance-api

### Steps:
- Edit  `lib/services/constants.dart` => BASE_URL = http://10.0.2.2:1337 (for emulator) / http://localhost:1337 (for web)
- Open `localhost:1337/admin`, do the setup proccess to create admin user
- After login as admin, go to roles settings -> Authenticated
  ![image](https://github.com/ghufr/attendance_flutter/assets/20156570/965c1ecf-7cdd-4400-ad42-a040eb2d4cb3)
- Check the `find` & `findMine` and click save
  ![image](https://github.com/ghufr/attendance_flutter/assets/20156570/3fe299c2-b4f2-4f30-aa22-cb25b43535c4)

- Run the API project run: `npm run develop`
- Start android emulator / connect adb devices (optional)
- On the App project run: `flutter run`

After the API running, you can check the `localhost:1337/admin` to view dashboard

## How to Build (Production)

- Change `BASE_URL` in `lib/services/constants.dart`
- run `flutter build`

## API Documentation

The API made using strapi.js, a Headless CMS to quickly prototyping, you can found API specs in this Postman Collection:
https://www.postman.com/ghf-dev/workspace/public/collection/2708961-ff1c0681-7a65-418a-9629-189d19f3a95c
