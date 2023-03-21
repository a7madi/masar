
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFFileGenerator {
  Future<void> createPDF() async {
    final pdf = pw.Document();

    // Load a custom font from assets
    final fontData = await rootBundle.load('asset/fonts/Tajawal-Regular.ttf');
    final ttf = pw.Font.ttf(fontData);

    // Set the custom font as the default font for the document
    pdf.addPage(pw.Page(
      theme: pw.ThemeData.withFont(base: ttf),
      build: (pw.Context context) => pw.Directionality(
        textDirection: pw.TextDirection.rtl,
        child: pw.Center(
          child: pw.Text('مرحبا!', style:const pw.TextStyle(fontSize: 50)),
        ),
      ),
    ));

    Uint8List bytes = await pdf.save();
    Printing.sharePdf(bytes: bytes, filename: 'masar_trip_file.pdf');
  }
}
