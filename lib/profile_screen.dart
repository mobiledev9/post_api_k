import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('images/Ketaki-Mategaonkar.jpeg'),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text(
                  'Ketki',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
