import 'package:carpooling3/firebase_options.dart';
import 'package:carpooling3/screens/home_page2.dart';
import 'package:carpooling3/screens/home_screen.dart';
import 'package:carpooling3/screens/map_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carpooling3/providers/ride_provider.dart';
import 'screens/getstarted_screen.dart';
import 'screens/signup_screen.dart'; 
import 'screens/login_screen.dart'; 
import 'screens/home_page3.dart'; 
import 'screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';  // FirebaseAuth for authentication

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Ensure Firebase is initialized
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on FirebaseException catch (e) {
    print("Firebase initialization error: ${e.message}");
    // You can show an alert dialog or error message to the user here
  } catch (e) {
    print("General error during Firebase initialization: $e");
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => RideProvider(),
      child: const Carpooling3(),
    ),
  );
}

class Carpooling3 extends StatelessWidget {
  const Carpooling3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Firebase authentication listener to determine if user is logged in
    User? user = FirebaseAuth.instance.currentUser; // Get current Firebase user

    // Assign userId if user is logged in, otherwise use default
    String currentUserId = user?.uid ?? "default_user_id";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CarPool',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Navigate to home if user is logged in, otherwise go to GetStartedScreen
      initialRoute: user != null ? '/home' : '/',
      routes: {
        '/': (context) => const GetStartedScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LoginScreen(isDriver: false),
        '/home1': (context) => const HomePage3(), // Driver's home page
        '/home2': (context) => const HomePage2(), // Rider's home page
        '/home': (context) => const HomeScreen(), // General home screen
        '/add': (context) => MapboxScreen(),
        '/search': (context) => MapboxScreen(),
        '/profile': (context) => const ProfilePage(
          isDriver: false, isRider: '',
        ),
      },
      onGenerateRoute: (settings) {
        // Handle undefined routes here if necessary
        return null;
      },
    );
  }
}
