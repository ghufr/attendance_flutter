import 'package:flutter/material.dart';

class EmployeeInputPage extends StatefulWidget {
  const EmployeeInputPage({Key? key}) : super(key: key);

  @override
  State<EmployeeInputPage> createState() => _EmployeeInputPageState();
}

class _EmployeeInputPageState extends State<EmployeeInputPage> {
  final _formKey = GlobalKey<FormState>();

  submit() {
    // TODO LEON:
    // - Panggil API (UserService) -> create new user
    // - Kembali ke halaman sebelum
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create new user")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: const Column(
              children: [
                // TODO LEON: Buat form input user baru (sama kayak form register)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
