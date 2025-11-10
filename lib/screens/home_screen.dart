import 'package:flutter/material.dart';
import '../services/ocr_service.dart';
import '../screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isScanning = false;

  Future<void> handleScan() async {
    if (isScanning) return; // prevent multiple scans at once
    setState(() => isScanning = true);

    try {
      final text = await OCRService.pickAndRecognizeText();
      if (text != null && text.isNotEmpty && mounted) {
        // Navigate safely
        Future.microtask(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ResultScreen(text: text)),
          );
        });
      } else {
        // Show message if no text found
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No text detected. Please try again.')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error scanning text: $e')),
        );
        print('Error scanning text : $e ');
      }
    } finally {
      if (mounted) setState(() => isScanning = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scribly'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: handleScan,
              icon: const Icon(Icons.camera_alt),
              label: Text(isScanning ? 'Scanning...' : '📸 Scan Handwriting'),
            ),
          ],
        ),
      ),
    );
  }
}
