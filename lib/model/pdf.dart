import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFFileGenerator {
  Future<void> createPDF() async {
    final pdf = pw.Document();
    const font1Path = 'asset/fonts/Tajawal-Regular.ttf';
    const font2Path = 'asset/fonts/IBMPlexSansArabic-Regular.ttf';
    // Load a custom font from assets
    final fontData = await rootBundle.load(font2Path);
    final ttf = pw.Font.ttf(fontData);

    // Set the custom font as the default font for the document
    pdf.addPage(pw.Page(
      theme: pw.ThemeData.withFont(base: ttf),
      build: (pw.Context context) => pw.Directionality(
        textDirection: pw.TextDirection.rtl,
        child: pw.Column(
          children: [
            pw.Text('خط السير', style: pw.TextStyle(fontSize: 20)),
            _tripTable(fontData)
          ],
        ),
      ),
    ));

    Uint8List bytes = await pdf.save();
    Printing.sharePdf(bytes: bytes, filename: 'masar_trip_file.pdf');
  }

  pw.Widget _tripTable(ByteData headerFont) {
    List<List<String>> data = [
      ['نقطة التحميل', 'الوجهة', 'التاريخ - الوقت'].reversed.toList(),
      ['مطار جدة الدولي', 'فندق جراند مكة', '2023/03/21 - 17:00']
          .reversed
          .toList(),
      ['فندق جراند مكة', 'مزارات مكة - جعرانة', '2023/03/22 - 12:00']
          .reversed
          .toList(),
    ];

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
