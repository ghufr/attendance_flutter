import 'package:app_presensi_pegawai/models/submodels/office.dart';
import 'package:flutter/material.dart';

class OfficeCard extends StatelessWidget {
  final void Function() onTap;
  final OfficeData office;
  const OfficeCard({Key? key, required this.onTap, required this.office})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.deepPurple.withAlpha(30),
        child: Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                office.attributes.cover?.data.attributes!
                        .getLink("thumbnail") ??
                    "https://via.placeholder.com/168",
              ),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      office.attributes.name,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(height: 6),
                    Text(
                      office.attributes.address!.city ?? '',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
