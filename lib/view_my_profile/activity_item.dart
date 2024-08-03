import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard

class ActivityItem extends StatelessWidget {
  final String profileImageUrl;
  final String userName;
  final dynamic activityDescription; // Can be String or Image URL
  final String timestamp;
  final bool showFollowButton;
  final bool isImage;
  final VoidCallback onDelete; // Add this callback

  const ActivityItem({
    super.key,
    required this.profileImageUrl,
    required this.userName,
    required this.activityDescription,
    required this.timestamp,
    this.showFollowButton = false,
    this.isImage = false,
    required this.onDelete, // Add this parameter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0), // Adjust radius as needed
        child: Container(
          color: Colors.white, // Background color for the container
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(profileImageUrl)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            Text(timestamp, style: TextStyle(color: Colors.grey[600])), // Updated color
                            Spacer(), // Pushes the follow button to the right
                            IconButton(
                              icon: Icon(Icons.delete, color: Color.fromARGB(255, 48, 87, 75)), // Use delete icon
                              onPressed: onDelete, // Call the onDelete callback
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        if (!isImage) Text(activityDescription),
                        if (isImage)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Image.network(activityDescription),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              // Add like button or other elements here (optional)
            ],
          ),
        ),
      ),
    );
  }
}
