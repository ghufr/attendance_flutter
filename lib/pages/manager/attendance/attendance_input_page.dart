import 'package:flutter/material.dart';

class AttendanceInputPage extends StatefulWidget {
  const AttendanceInputPage({Key? key}) : super(key: key);

  @override
  _AttendanceInputPageState createState() => _AttendanceInputPageState();
}

class _AttendanceInputPageState extends State<AttendanceInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Attendance"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: const Column(
            children: [
              //
            ],
          ),
        ),
      ),
    );
  }
}
