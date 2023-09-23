import 'package:flutter/material.dart';

class OfficeInputPage extends StatefulWidget {
  const OfficeInputPage({Key? key}) : super(key: key);

  @override
  _OfficeInputPageState createState() => _OfficeInputPageState();
}

class _OfficeInputPageState extends State<OfficeInputPage> {
  final _formKey = GlobalKey<FormState>();

  submit() async {
    // TODO WULUNG:
    // - Panggil API -> create new office
    // - Kembali ke halaman sebelum
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new Office"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: const Column(
              children: [
                Text('Hello world')
                // TODO WULUNG: Buat form input office baru
                //(nama, provinsi, kota, kecamatan, kode pos, phone & gambar kalo bisa)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
