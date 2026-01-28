import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool _showImage = false;
  bool _showName = false;
  bool _showRole = false;
  bool _showQuote = false;

  @override
  void initState() {
    super.initState();
    // A sequence of delays to trigger animations one by one
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) setState(() => _showImage = true);
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) setState(() => _showName = true);
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      if (mounted) setState(() => _showRole = true);
    });
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) setState(() => _showQuote = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Introduction",
            // style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue[200],
      ),
      body: Container(
        // Outer Container design
        width: 350,
        padding: const EdgeInsets.all(20), // Internal Spacing
        margin: const EdgeInsets.all(20), // External spacing
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            // 1. Left Side: Profile picture
            AnimatedOpacity(
              opacity: _showImage ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueAccent, width: 2),
                ),
                child: const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(
                    'assets/images/PHOTO-2026-01-28-17-42-20.jpg',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15), // Spacing between image and text.
            // 2. Right Side: Text Information (column)
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  AnimatedOpacity(
                    opacity: _showName ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: const Text(
                      'Saksham Kashyap',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  // Role/Title
                  AnimatedOpacity(
                    opacity: _showRole ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: const Text(
                      'Flutter Developer',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description/quote
                  AnimatedOpacity(
                    opacity: _showQuote ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          '"Creating experiences, not just applications."',
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
