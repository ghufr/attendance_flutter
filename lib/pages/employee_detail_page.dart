import 'package:app_presensi_pegawai/models/submodels/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class EmployeeDetailPage extends StatefulWidget {
  const EmployeeDetailPage({Key? key}) : super(key: key);

  @override
  _EmployeeDetailPageState createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  UserAttributes? user;

  _getEmployee() async {
    // TODO LEON:
    // - Ambil userId yang dikirim dari halaman employee_list
    // - Panggil API (UserService) -> get user by id
    // - Set state user
  }

  @override
  void initState() {
    super.initState();
    _getEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // TODO LEON: Buat tampilan detail karyawan
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 220.0,
            flexibleSpace: const FlexibleSpaceBar(
              background: FlutterLogo(),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.edit,
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.all(24),
                  height: 1000,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Employee 1",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Row(
                        children: [
                          Icon(
                            FeatherIcons.mapPin,
                            size: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("DKI Jakarta"),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            FeatherIcons.phone,
                            size: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("+6232323"),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text("Check In Time: 09.00"),
                      const Text("Check Out Time: 15.00"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.grey[900],
      //   child: Container(
      //     padding: EdgeInsets.all(12),
      //     child: ElevatedButton(
      //       style: ElevatedButton.styleFrom(
      //         elevation: 0,
      //         padding: EdgeInsets.symmetric(vertical: 12),
      //       ),
      //       onPressed: () {},
      //       child: Text("Check Out"),
      //     ),
      //   ),
      // ),
    );
  }
}
