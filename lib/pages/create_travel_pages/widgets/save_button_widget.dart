import 'package:flutter/material.dart';
import 'package:masar/model/pdf.dart';
import 'package:masar/model/trip.dart';
import 'package:provider/provider.dart';
import '../../../provider/trip_details_provider.dart';

class SaveBtn extends StatelessWidget {
  const SaveBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dp = Provider.of<TripDetailsProvider>(context, listen: true);

    return Container(
        decoration: const BoxDecoration(color: Colors.blue),
        child: TextButton(
          child: const Text(
            'الحفظ وتصدير إشعار الرحلة',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            await PDFFileGenerator().createPDF();
          },
        ));
  }
}
