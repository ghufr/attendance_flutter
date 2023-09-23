// ignore_for_file: unnecessary_const

import 'package:app_presensi_pegawai/components/attendance_card.dart';
import 'package:app_presensi_pegawai/models/attendance.dart';
import 'package:app_presensi_pegawai/models/submodels/user.dart';
import 'package:app_presensi_pegawai/services/api/attendance.dart';
import 'package:app_presensi_pegawai/services/api/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserAttributes? user;
  List<AttendanceOfficeAttributes> attendances = [];

  _getProfile() async {
    UserAttributes profile = await UserService().profile();
    List<AttendanceOfficeAttributes> reversedAttendances =
        List.from(profile.attendances!.reversed);
    setState(() {
      user = profile;
      attendances = reversedAttendances;
    });
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  Future<void> _showAttendanceDialog(
      AttendanceOfficeAttributes attendance) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            attendance.office!.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Check In',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  DateFormat("EEE, dd MMM yyyy @ kk:mm").format(
                    attendance.createdAt.toLocal(),
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Check Out',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  attendance.status == 'checkout'
                      ? DateFormat("EEE, dd MMM yyyy @ kk:mm").format(
                          attendance.updatedAt.toLocal(),
                        )
                      : '-',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white70,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            if (attendance.status == 'checkin')
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Text('Check Out'),
                onPressed: () async {
                  await AttendanceService().update(
                    attendance.id.toString(),
                    {"status": "checkout"},
                  );
                  await _getProfile();

                  Navigator.of(context).pop();
                },
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        user?.avatar?.getLink('thumbnail') ??
                            'https://via.placeholder.com/168',
                        height: 48,
                        width: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.username ?? '███',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          user?.email ?? '████████',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 16,
            ),
            child: const Text(
              "HISTORY",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            shrinkWrap: true,
            itemCount: attendances.length,
            itemBuilder: (BuildContext ctx, int index) {
              return AttendanceCard(
                onTap: () {
                  _showAttendanceDialog(attendances.elementAt(index));
                },
                attendance: attendances.elementAt(index),
              );
            },
          ),
        ],
      ),
    );
  }
}
