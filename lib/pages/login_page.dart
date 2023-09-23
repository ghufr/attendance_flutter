import 'package:app_presensi_pegawai/services/api/auth.dart';
import 'package:flutter/material.dart';

import 'package:app_presensi_pegawai/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String? identifier, password;

  login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusManager.instance.primaryFocus?.unfocus();
      UserAuth user = await AuthService.login(identifier, password);

      if (user.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid login')),
        );
        return;
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (user.jwt != null) {
        await prefs.setString('jwt', user.jwt ?? '');
        await prefs.setString('userId', user.user!.id.toString());

        Navigator.pushReplacementNamed(context, "/");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                        identifier = value!;
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
                      hintText: "Enter email",
                    ),
                  ),
                  const SizedBox(
                    height: 16,
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
                    onPressed: login,
                    child: const Text(
                      'Log In',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/register");
                    },
                    child: const Text("Register"),
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
