import 'package:flutter/material.dart';

class PersonalizationScreen extends StatelessWidget {
  const PersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personalization'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Personalization Screen'),
          ],
        ),
      ),
    );
  }
}
