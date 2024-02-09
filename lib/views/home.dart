import 'package:flutter/material.dart';
import 'package:test1/pages/profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // le liste des diplomes
  List<Map<String, dynamic>> availableHobbies = [
    {"name": "Bacalauriat", "isChecked": false},
    {"name": "BTS", "isChecked": false},
    {
      "name": "Licence",
      "isChecked": false,
    },
    {"name": "Master", "isChecked": false},
    {"name": "Doctorat", "isChecked": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/backg1.jpg'),
                radius: 50.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nom',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Prenom',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Adress',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selectionner vos Diplomes:',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  const Divider(),
                  const SizedBox(height: 5),
                  // The checkboxes will be here
                  Column(
                    children: availableHobbies.map((hobby) {
                      return CheckboxListTile(
                        value: hobby["isChecked"],
                        title: Text(hobby["name"] as String),
                        onChanged: (newValue) {
                          setState(() {
                            hobby["isChecked"] = newValue;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  // Display the result here
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Wrap(
                    children: availableHobbies.map((hobby) {
                      if (hobby["isChecked"] == true) {
                        return Card(
                          elevation: 3,
                          color: Colors.cyan,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(hobby["name"]),
                          ),
                        );
                      }

                      return Container();
                    }).toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}