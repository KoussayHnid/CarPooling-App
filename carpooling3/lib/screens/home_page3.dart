import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'navbar_driver.dart';

class HomePage3 extends StatelessWidget {
  const HomePage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CarPool'),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.bell),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/homepage2.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavbarDriver(),
    );
  }
}
