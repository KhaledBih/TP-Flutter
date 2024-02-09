
//Acceil page
import 'package:flutter/material.dart';

class BackgroundPhotoPage extends StatelessWidget {
  const BackgroundPhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/home.jpeg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Navigate to the Home page and remove all other routes
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
