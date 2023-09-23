import 'package:app_presensi_pegawai/models/submodels/user.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final void Function() onTap;
  final UserAttributes employee;

  const EmployeeCard({Key? key, required this.onTap, required this.employee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                employee.avatar?.getLink("thumbnail") ??
                    'https://via.placeholder.com/48',
                height: 48,
                width: 48,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                employee.username ?? '',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Manager - Jakarta',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
