import 'package:app_presensi_pegawai/models/submodels/user.dart';
import 'package:app_presensi_pegawai/services/api/auth.dart';
import 'package:app_presensi_pegawai/services/api/user.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserAttributes? user;

  logout() {
    AuthService().deleteJwt();
    Navigator.pushReplacementNamed(context, "/login");
  }

  _getProfile() async {
    UserAttributes profile = await UserService().profile();
    // print(profile.avatar);
    if (mounted) {
      setState(() {
        user = profile;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                user?.avatar?.getLink('thumbnail') ??
                    'https://via.placeholder.com/168',
                height: 64,
                width: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user?.username ?? '████',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              user?.email ?? '██████████',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/manager/attendance/list');
                  },
                  child: const Text("Dashboard"),
                  style: TextButton.styleFrom(
                    minimumSize: const Size(88, 48),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red,
                  ),
                  onPressed: logout,
                  child: const Text("Logout"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
