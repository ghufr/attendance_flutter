import 'package:flutter/material.dart';
import 'package:app_presensi_pegawai/services/api/auth.dart';
import 'package:app_presensi_pegawai/models/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? email, username, password;

  register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      FocusManager.instance.primaryFocus?.unfocus();

      UserAuth response = await AuthService.register(username, email, password);

      if (response.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid register')),
        );
        return;
      }

      Navigator.of(context).pushReplacementNamed("/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in the Username field';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white10,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      helperText: "",
                      hintText: "Username",
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        email = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in the Email field';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white10,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      helperText: "",
                      hintText: "Email",
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        password = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in the Password field';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      fillColor: Colors.white10,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      helperText: "",
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                        double.infinity,
                        48,
                      ),
                    ),
                    onPressed: register,
                    child: const Text(
                      'Register',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
