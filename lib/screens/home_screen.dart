import 'package:flutter/material.dart';
import '../services/ocr_service.dart';
import '../screens/result_screen.dart';
import '../widgets/pdf_service.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? recognizedText;

  Future<void> handleScan() async {
    final text = await OCRService.pickAndRecognizeText();
    if (text != null && mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ResultScreen(text: text)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HandWrite2Type'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              label: '📸 Scan Handwriting',
              onPressed: handleScan,
            ),
          ],
        ),
      ),
    );
  }
}
