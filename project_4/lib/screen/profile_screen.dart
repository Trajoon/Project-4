import 'package:flutter/material.dart';
import 'package:project_4/widgets/profile_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff121212),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFFFF)),
              ),
              SizedBox(
                height: 20,
              ),
              ProfileSection(
                image: "image/person-outline.png",
                text1: "Profile Setting",
                text2: "Setting regarding your profile",
              ),
                ProfileSection(
                image: "image/newspaper-outline.png",
                text1: "News Setting",
                text2: "Choose your favorite topics",
              ),
                ProfileSection(
                image: "image/notifications-outline.png",
                text1: "Notifiactions",
                text2: "When would you like to be notified",
              ),
                ProfileSection(
                image: "image/folder-open-outline.png",
                text1: "Subscriptions",
                text2: "Currently, you are in starter plan",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
