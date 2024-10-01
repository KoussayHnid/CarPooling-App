import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> fetchProfile(bool isDriver, String userId) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection(isDriver ? 'drivers' : 'riders')
          .doc(userId)
          .get();

      // Check if the document exists and return data
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>?; 
      } else {
        throw Exception('User profile does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching profile: $e');
    }
  }

  Future<User?> signUpD(String email, String password, String firstName, String lastName, 
  String carBrand, String carColor, String phoneNumber, String seats, 
  String birthday) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      return user;
    } catch (e) {
      print("Sign up failed: $e");
      return null;
    }
  }

   Future<User?> signUpR(String email, String password, String firstName, String lastName,
    String phoneNumber, String birthday) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      return user;
    } catch (e) {
      print("Sign up failed: $e");
      return null;
    }
  }

  // Method to sign out the user
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  // Method to get the current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
