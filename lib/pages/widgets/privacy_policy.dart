import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrl(
          Uri.https('www.google.com'),
          mode: LaunchMode.platformDefault,
        );
      },
      child: const SizedBox(
        child: Text(
          'Política de Privacidade',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
