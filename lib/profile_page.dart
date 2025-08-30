import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String id = 'ProfilePage';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile avatar + Name + Email
            Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xFFE5E5E5),
                  child: Icon(Icons.pets, size: 50, color: Colors.black),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Ruffa Mae C. Gueco",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "ruffamaegueco@gmail.com",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),

                // Edit Profile Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const PlaceholderPage(title: "Edit Profile"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                  ),
                  child: const Text("Edit Profile"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Menu Items with navigation
            buildMenuTile(context, Icons.person, "Profile Details"),
            buildMenuTile(context, Icons.lock, "Password"),
            buildMenuTile(context, Icons.notifications, "Notifications"),
            buildMenuTile(context, Icons.apps, "About Application"),
            buildMenuTile(context, Icons.help_outline, "Help/FAQ"),
            buildMenuTile(context, Icons.delete, "Delete my Account",
                isDestructive: true),
          ],
        ),
      ),
    );
  }

  // Reusable menu item widget with navigation
  static Widget buildMenuTile(BuildContext context, IconData icon, String title,
      {bool isDestructive = false}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceholderPage(title: title),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon,
                    size: 20,
                    color: isDestructive ? Colors.red : Colors.black),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDestructive ? Colors.red : Colors.black,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward, size: 18, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

// Simple placeholder page for navigation
class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
