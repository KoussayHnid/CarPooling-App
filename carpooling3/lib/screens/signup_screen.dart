import 'package:carpooling3/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'rider_signup.dart';
import 'driver_signup.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 185, 184, 187),
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.house, color: Colors.deepPurple),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          title: const Text('Sign Up'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Rider'),
              Tab(text: 'Driver'),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sign.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const TabBarView(
              children: [
                RiderSignUp(),
                DriverSignUp(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
