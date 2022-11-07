library pdf_tools;

import 'dart:io';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

class Main {

  static PdfController getPdfFile$Api21(File pdfFile){
    final pdfController = PdfController(
      document: PdfDocument.openFile(pdfFile.path),
    );

    return pdfController;
  }

  static Future<PDFDocument> getPdfFile(File pdfFile){
    return PDFDocument.fromFile(pdfFile);
  }

  static Future<PDFDocument> getPdfByUrl(String url){
    return PDFDocument.fromURL(url);
  }

  static Future<void> openPdfByBrowser(String url) async{
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.platformDefault,
        webViewConfiguration: WebViewConfiguration(),
      );
    }
    else {
      return Future.error('can not launch');
    }
  }

  static Future<OpenResult> openPdfByOtherApp(String path){
    return OpenFile.open(path, type: 'application/pdf', uti: 'com.adobe.pdf');
  }
}
