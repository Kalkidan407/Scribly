import 'package:flutter/material.dart';
import '../services/pdf_service.dart';
import '../widgets/pdf_service.dart';

class ResultScreen extends StatefulWidget {
  final String text;
  const ResultScreen({super.key, required this.text});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Extracted Text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Recognized text will appear here...",
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              label: '💾 Export as PDF',
              onPressed: () async {
                await PDFService.exportAsPdf(_controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
