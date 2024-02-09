import 'package:flutter/material.dart';
import 'package:test1/pages/BackgroundPhotoPage.dart';
import 'package:test1/pages/CalculatorScreen.dart';
import 'package:test1/pages/MyCounterWidget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profil.jpg'),
                    radius: 42.0,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Khaled Abdallahi Bih',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'khaledbih401@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BackgroundPhotoPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.inbox),
              title: const Text('Boîte de réception'),
              onTap: () {
                // Navigate to inbox page or perform action
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text('Contacts'),
              onTap: () {
                // Navigate to contacts page or perform action
              },
            ),
             ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Calculator'),
              onTap: () {
                  Navigator.push(
                       context,
                         MaterialPageRoute(builder: (context) => const CalculatorScreen()),
                       );
                      },  ),

            ListTile(
              leading: const Icon(Icons.countertops),
              title: const Text('Counter'),
              onTap: () {
                  Navigator.push(
                       context,
                         MaterialPageRoute(builder: (context) => const MyCounterWidget()),
                       );
                      },  ),
             ],
        ),
      ),
    );
  }
}
