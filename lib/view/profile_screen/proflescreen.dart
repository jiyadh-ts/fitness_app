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
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://th.bing.com/th?id=OIP.NqY3rNMnx2NXYo3KJfg43gHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"), // Replace with your asset image
                backgroundColor: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle edit profile
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                    ),
                    title: const Text(
                      'Settings',
                    ),
                    onTap: () {
                      // Navigate to settings
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.history,
                    ),
                    title: const Text(
                      'Activities',
                    ),
                    onTap: () {
                      // Navigate to activities
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.help,
                    ),
                    title: const Text(
                      'Help & Support',
                    ),
                    onTap: () {
                      // Navigate to help and support
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.notifications,
                    ),
                    title: const Text(
                      'Notifications',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      // Navigate to help and support
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.event_note,
                    ),
                    title: const Text(
                      'Terms & conditions',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      // Navigate to help and support
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      // Handle logout
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
