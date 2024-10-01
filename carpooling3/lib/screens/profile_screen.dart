import 'package:carpooling3/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  final bool isDriver; 
  final String isRider; 

  const ProfilePage({Key? key, required this.isDriver, required this.isRider}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _authService = AuthService();
  Map<String, dynamic>? _userProfile;
  bool _isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Fetch user profile
        _userProfile = await _authService.fetchProfile(widget.isDriver, user.uid);
      } else {
        // Handle case where user is not authenticated
        if (kDebugMode) {
          print('User is not authenticated.');
        }
      }
    } catch (e) {
      // Handle error fetching profile
      if (kDebugMode) {
        print('Error fetching profile: $e');
      }
    } finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Show loading spinner
          : _userProfile != null
              ? _buildProfileDetails(context)
              : const Center(child: Text('Profile data not available.')), // Handle no profile data
    );
  }

  Widget _buildProfileDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'First Name: ${_userProfile!['first_name'] ?? 'N/A'}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Last Name: ${_userProfile!['last_name'] ?? 'N/A'}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Phone Number: ${_userProfile!['phone_number'] ?? 'N/A'}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Birthday: ${_userProfile!['birthday'] ?? 'N/A'}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (widget.isDriver) ...[
            const SizedBox(height: 8),
            Text(
              'Car Brand: ${_userProfile!['car_brand'] ?? 'N/A'}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Car Color: ${_userProfile!['car_color'] ?? 'N/A'}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ],
      ),
    );
  }
}
