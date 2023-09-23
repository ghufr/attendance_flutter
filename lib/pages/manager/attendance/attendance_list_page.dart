import 'package:flutter/material.dart';

class AttendanceListPage extends StatefulWidget {
  const AttendanceListPage({Key? key}) : super(key: key);

  @override
  _AttendanceListPageState createState() => _AttendanceListPageState();
}

class _AttendanceListPageState extends State<AttendanceListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const Column(
            children: [
              Text("Hello World")
              // TODO LEON: Buat tampilan list kehadiran dari semua employee
            ],
          ),
        ),
      ),
    );
  }
}
