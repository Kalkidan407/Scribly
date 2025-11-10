import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';


class OCRService {
  static Future<String?> pickAndRecognizeText() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    final inputImage = InputImage.fromFilePath(image.path);
    final textRecognizer = TextRecognizer();
    final recognizedText = await textRecognizer.processImage(inputImage);
    await textRecognizer.close();

    return recognizedText.text;
  }
}


// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:tesseract_ocr/tesseract_ocr.dart';
// import 'package:image/image.dart' as img;

// class OCRService {
//   static Future<String?> pickAndRecognizeText() async {
//     final picker = ImagePicker();
//     final image = await picker.pickImage(source: ImageSource.camera);
//     if (image == null) return null;

//     // Preprocess the image for better accuracy
//     final processedImageFile = await _preprocessImage(image.path);

//     try {
//       // extractText returns String? in v0.5.0
//       final String? rawText = await TesseractOcr.extractText(processedImageFile.path);
      


//       // Return null if text is empty or null
//       if (rawText == null || rawText.trim().isEmpty) return null;

//       return rawText.trim();
//     } catch (e) {
//       print('Tesseract OCR error: $e');
//       return null;
//     }
//   }

//   static Future<File> _preprocessImage(String path) async {
//     final bytes = await File(path).readAsBytes();
//     img.Image? image = img.decodeImage(bytes);
//     if (image == null) return File(path);


//     final newPath = '${path}_processed.jpg';
//     await File(newPath).writeAsBytes(img.encodeJpg(image, quality: 90));
//     return File(newPath);
//   }
// }
