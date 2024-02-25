import 'package:flutter/material.dart';
import 'package:project_4/model/news.dart';
import 'package:project_4/widgets/edit_widget.dart';

class EditScreen extends StatelessWidget {
 
  const EditScreen({super.key, required this.news});

  // Property to store the news being edited
  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        actions: [
          // Save button in the app bar
          TextButton(
            onPressed: () {},
            child: const Text(
              "Save",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xffFFFFFF),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // EditWidget for the title
                EditWidget(
                  text1: "Title",
                  text2: news.title,
                ),
                // EditWidget for the summary
                EditWidget(
                  text1: "Summary",
                  text2: news.summary,
                ),
                // EditWidget for the content
                EditWidget(
                  text1: "Content",
                  text2: news.content,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
