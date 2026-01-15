import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Crime Hub'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to Crime Hub',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Crime Hub is an interactive learning platform where concepts are explained as if you are solving a crime. Dive into a fun and memorable way to understand topics, from coding errors to economic concepts.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'How It Works',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Each concept is broken down like a crime scene investigation:\n• Suspects – Possible causes or key players\n• Evidence – Important details and clues\n• Verdict – Clear explanation and solution',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Why Crime Hub?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Learning becomes engaging, interactive, and easy to remember when each concept is treated like a mystery to solve. Perfect for students, curious minds, and anyone who loves problem-solving!',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              const Text(
                'Frequently Asked Questions (FAQ)',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildFAQItem(
                'What is Crime Hub?',
                'Crime Hub is a learning platform where concepts are explained in the style of crime investigations, making learning fun, memorable, and interactive.',
              ),
              _buildFAQItem(
                'How do I explore a concept?',
                'Simply enter a topic like "Deadlock" or "Inflation", and Crime Hub will break it down into suspects, evidence, and a final verdict.',
              ),
              _buildFAQItem(
                'Is it free?',
                'Yes! You can explore concepts for free and learn at your own pace.',
              ),
              _buildFAQItem(
                'Can I use it on the web?',
                'Absolutely. Crime Hub runs on web, mobile, and desktop, with a responsive and intuitive interface.',
              ),
              _buildFAQItem(
                'What if I encounter issues?',
                'If you face any problems or bugs, you can reach out via GitHub issues. We welcome feedback and contributions!',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              answer,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
