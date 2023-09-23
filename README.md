# Shift - Aplikasi Presensi Pegawai

This application showcasing

- MVS (Model, View, Service)
- QR code scanner
- GPS to locate current position

## How to Run The App

### Requirements

- Flutter: ^3.13
- Dart: ^3.1
- Android Studio / Xcode
- Backend API running -> see https://github.com/ghufr/attendance-api

### Steps:

- Run the API project run: `npm run develop`
- On the App project run: `flutter run`

After the API running, you can check the `localhost:8000/admin` to view dashboard

## How to Build (Production)

- Change `BASE_URL` in `services/constants`
- run `flutter build`

## API Documentation

The API made using strapi.js, a Headless CMS to quickly prototyping, you can found API specs in this Postman Collection:
https://www.postman.com/ghf-dev/workspace/public/collection/2708961-ff1c0681-7a65-418a-9629-189d19f3a95c
