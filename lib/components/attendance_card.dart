import 'package:app_presensi_pegawai/models/attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';

class AttendanceCard extends StatelessWidget {
  final void Function() onTap;
  final AttendanceOfficeAttributes attendance;
  const AttendanceCard(
      {Key? key, required this.onTap, required this.attendance})
      : super(key: key);

  _buildStatusIcon(BuildContext context) {
    if (attendance.status == 'checkout') {
      return const Icon(
        FeatherIcons.cornerDownRight,
        color: Colors.red,
      );
    } else {
      return Icon(
        FeatherIcons.cornerDownLeft,
        color: Theme.of(context).colorScheme.secondary,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      splashColor: Colors.deepPurple.withAlpha(40),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  attendance.office!.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 24),
                Text(
                  DateFormat("EEE, dd MMM yyyy @ kk:mm").format(
                    attendance.updatedAt.toLocal(),
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            _buildStatusIcon(context)

            // Text(
            //   attendance.status ?? '',
            //   style: TextStyle(
            //     fontSize: 14,
            //     fontWeight: FontWeight.normal,
            //     color: Theme.of(context).colorScheme.secondary,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
