// import 'dart:html';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'trip.dart';

class PDF {
  late final Trip _trip;

  PDF(Trip trip) {
    _trip = trip;
  }
  Future<void> createPdf() async {
    var pdf = Document();
    pdf.addPage(
      Page(build: (ctx) {
        return Center(child: Text('Masar',style: TextStyle(font: Font.helvetica())));
      }),
    );
    final file = await _savedDocument(name: 'masar.pdf', pdf: pdf);
    _openFile(file);
  }

  Future _openFile(File file) async {
    final filePath = file.path;
    await OpenFile.open(filePath);
  }

  Future<File> _savedDocument(
      {required String name, required Document pdf}) async {
    final bytes = await pdf.save();
    final dir = await getApplicationSupportDirectory();
    final file = File('${dir.path}/$name');
    return file;
  }
}
