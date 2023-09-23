import 'package:app_presensi_pegawai/pages/employee_detail_page.dart';
import 'package:app_presensi_pegawai/pages/office_detail_page.dart';
import 'package:app_presensi_pegawai/theme.dart';
import 'package:flutter/material.dart';

import 'package:app_presensi_pegawai/pages/main_page.dart';
import 'package:app_presensi_pegawai/pages/login_page.dart';
import 'package:app_presensi_pegawai/pages/register_page.dart';
import 'package:app_presensi_pegawai/pages/scan_page.dart';

import 'package:app_presensi_pegawai/pages/manager/attendance/attendance_list_page.dart';

import 'package:app_presensi_pegawai/pages/manager/employee/employee_input_page.dart';
import 'package:app_presensi_pegawai/pages/employee_list_page.dart';

import 'package:app_presensi_pegawai/pages/manager/office/office_input_page.dart';
import 'package:app_presensi_pegawai/pages/office_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeClass.darkTheme,
      theme: ThemeClass.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/scan': (context) => const ScanPage(),
        '/office/detail': (context) => const OfficeDetailPage(),
        '/employee/detail': (context) => const EmployeeDetailPage(),
        '/manager/attendance/list': (context) => const AttendanceListPage(),
        '/manager/employee/input': (context) => const EmployeeInputPage(),
        '/manager/employee/list': (context) => const EmployeeListPage(),
        '/manager/office/input': (context) => const OfficeInputPage(),
        '/manager/office/list': (context) => const OfficeListPage(),
      },
    );
  }
}
