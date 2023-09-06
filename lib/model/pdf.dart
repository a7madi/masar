import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import '../provider/trip_details_provider.dart';

class PDFFileGenerator {
  late final BuildContext _ctx;
  PDFFileGenerator(BuildContext ctx) {
    _ctx = ctx;
  }
  Future<void> createPDF() async {
    final pdf = pw.Document();
    const fontPath = 'asset/fonts/IBMPlexSansArabic-Regular.ttf';
    // Load a custom font from assets
    final fontData = await rootBundle.load(fontPath);
    final ttf = pw.Font.ttf(fontData);

    pdf.addPage(pw.Page(
      theme: pw.ThemeData.withFont(base: ttf),
      build: (pw.Context context) => pw.Directionality(
        textDirection: pw.TextDirection.rtl,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            _letter(),
            pw.SizedBox(height: 25),
            _tripTable(fontData),
            pw.SizedBox(height: 25),
            _tripOwner(),
          ],
        ),
      ),
    ));

    Uint8List bytes = await pdf.save();
    // await _saveAndOpen('masar_trip_file.pdf', bytes);
    Printing.sharePdf(bytes: bytes, filename: 'masar_trip_file.pdf');
  }

  Future<void> _saveAndOpen(String fileName, List<int> bytes) async {
    final path = (await getExternalStorageDirectory())!.path;
    final file = File('$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(file.path);
  }

  pw.Widget _letter() {
    final company =
        Provider.of<TripDetailsProvider>(_ctx, listen: false).currentTCompany;
    final tripNumber =
        Provider.of<TripDetailsProvider>(_ctx, listen: false).trip.tripNumber;
    return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
      pw.Text('سعادة المسؤول عن اعتماد خط السير بـ${company.companyName}'),
      pw.Text('السلام عليكم ورحمة الله وبركاته'),
      pw.Text(
          'بعد التحية آمل من سعادتكم إعتماد خط السير الموضح حسب الجدول التالي للبرنامج رقم (${tripNumber}) وتوفير عدد (${company.numberOfBuses}) حافلة لنقل الركاب'),
    ]);
  }

  pw.Widget _tripOwner() {
    final tripOwner =
        Provider.of<TripDetailsProvider>(_ctx, listen: false).currentTripOwner;

    return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
      pw.RichText(
        text: pw.TextSpan(children: [
          const pw.TextSpan(text: 'مسؤول الرحلة: '),
          pw.TextSpan(text: '${tripOwner.name} '),
        ]),
      ),
      pw.RichText(
        text: pw.TextSpan(children: [
          const pw.TextSpan(text: 'رقم الجوال: '),
          pw.TextSpan(text: '${tripOwner.phoneNumber} '),
        ]),
      ),
    ]);
  }

  pw.Widget _tripTable(ByteData headerFont) {
    final destinations =
        Provider.of<TripDetailsProvider>(_ctx, listen: false).trip.destinations;
    List<List<String>> data = [
      ['نقطة التحميل', 'الوجهة', 'الوقت - التاريخ'].reversed.toList(),
    ];
    for (var d in destinations) {
      data.add([
        d.pickupLocation,
        d.dropLocation,
        '${d.date.toString().substring(0, 10).replaceAll('-', '/')} - ${(d.date.hour > 9) ? d.date.hour : '0' '${d.date.hour}'}:${(d.date.minute > 9) ? d.date.minute : '0' '${d.date.minute}'}'
      ].reversed.toList());
    }
    return pw.Directionality(
        textDirection: pw.TextDirection.rtl,
        child: pw.Table.fromTextArray(
          context: null,
          data: data,
          border: pw.TableBorder.all(width: 1),
          headerStyle: pw.TextStyle(
              fontWeight: pw.FontWeight.bold, font: pw.Font.ttf(headerFont)),
          cellAlignment: pw.Alignment.center,
        ));
  }
}
