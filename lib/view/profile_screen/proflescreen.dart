import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              color: Colors.blue[50],
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      "https://th.bing.com/th?id=OIP.NqY3rNMnx2NXYo3KJfg43gHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
                    ),
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'johndoe@example.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle edit profile
                    },
                    icon: const Icon(Icons.edit, size: 18),
                    label: const Text('Edit Profile'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // List Section
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(Icons.settings, 'Settings', () {
                    // Navigate to settings
                  }),
                  _buildListTile(Icons.history, 'Activities', () {
                    // Navigate to activities
                  }),
                  _buildListTile(Icons.help_outline, 'Help & Support', () {
                    // Navigate to help and support
                  }),
                  _buildListTile(Icons.notifications, 'Notifications', () {
                    // Navigate to notifications
                  }),
                  _buildListTile(Icons.description, 'Terms & Conditions', () {
                    // Navigate to terms & conditions
                  }),
                  const Divider(thickness: 1, height: 30),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Handle logout
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.blue),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          onTap: onTap,
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
        ),
        Divider(
          color: Colors.grey[300],
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }
}
