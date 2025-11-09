
import 'package:path/path.dart' ;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';


class PDFService {
  static Future<void> exportAsPdf(String text) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Text(
            text,
            style: const pw.TextStyle(fontSize: 16),
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/handwriting.pdf");
    await file.writeAsBytes(await pdf.save());
    await OpenFilex.open(file.path);
  }
}
