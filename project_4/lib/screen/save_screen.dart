import 'package:flutter/material.dart';
import 'package:project_4/widgets/news_widget.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: ListView(
        children: const [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Saved News",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF)),
                  ),
                 // NewsContainer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
