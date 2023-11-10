import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome to the Shop App. By using this app, you agree to be bound by the following terms and conditions:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '1. Use of the App',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '- You must be at least 18 years old to use this app.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- You agree to use this app for lawful purposes only.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '2. Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '- Your use of the app is also governed by our Privacy Policy.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '3. Limitation of Liability',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '- We are not responsible for any loss or damage incurred through the use of this app.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '4. Changes to Terms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '- We may update these terms from time to time. Please review them regularly.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '5. Contact Us',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '- If you have any questions about these terms, contact us at support@example.com.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '6. Termination of Use',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '- We reserve the right to terminate your use of the app at our discretion.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '7. Governing Law',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '- These terms are governed by and construed in accordance with the laws of your jurisdiction.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '8. Changes to the App',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '- We may modify or discontinue the app at any time without notice.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '9. User Responsibilities',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '- You are responsible for maintaining the confidentiality of your account credentials.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- You agree not to use the app for any unlawful activities.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '10. Dispute Resolution',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '- Any disputes will be resolved through arbitration in accordance with your local laws.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- You agree to waive your right to participate in class-action lawsuits.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
