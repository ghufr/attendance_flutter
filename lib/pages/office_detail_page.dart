import 'package:app_presensi_pegawai/models/office.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class OfficeDetailPage extends StatefulWidget {
  const OfficeDetailPage({Key? key}) : super(key: key);

  @override
  _OfficeDetailPageState createState() => _OfficeDetailPageState();
}

class _OfficeDetailPageState extends State<OfficeDetailPage> {
  OfficeFindOne? office;

  _getOffice() async {
    // TODO WULUNG:
    // - Ambil officeId yang dikirim dari halaman office_list
    // - Panggil API (OfficeService) -> find one office by id
    // - set office state
  }
  @override
  void initState() {
    super.initState();
    _getOffice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                  height: 500,
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
                        "SCBD Office",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Row(
                        children: [
                          Icon(
                            FeatherIcons.mapPin,
                            size: 16,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("DKI Jakarta"),
                          const SizedBox(
                            width: 16,
                          ),
                          Icon(
                            FeatherIcons.phone,
                            size: 16,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("+6232323"),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Address",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Text("DKI Jakarta, 12033"),
                      const Text("Jl. Jenderal Sudirman No.Kav 52-53"),
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
