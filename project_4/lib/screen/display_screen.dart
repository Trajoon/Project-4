import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/news_bloc.dart';
import 'package:project_4/model/news.dart';
import 'package:project_4/screen/edit_screen.dart';

class DisplayNews extends StatelessWidget {

  const DisplayNews({super.key, this.newsDisplay});

  // Property to store the displayed news
  final News? newsDisplay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset('image/Back.png')),
          IconButton(onPressed: () {}, icon: Image.asset('image/Icons.png')),
          IconButton(
              onPressed: () {
                // Trigger EditEvent when the edit button is pressed
                if (newsDisplay != null) {
                  BlocProvider.of<NewsBloc>(context)
                      .add(EditEvent(newsDisplay!));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditScreen(news: newsDisplay!),
                    ),
                  );
                }
              },
              icon: Image.asset('image/Frame 33.png'))
        ],
      ),
      body: ListView(
        children: [
          Image.network(newsDisplay?.img ?? ""),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('image/Frame12.png'),
                    const SizedBox(width: 5),
                    Text(
                      newsDisplay?.field.toUpperCase() ?? "",
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Color(0xffBDA6F5)),
                    ) //BDA6F5
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  newsDisplay?.title ?? "",
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF)),
                ),
                const SizedBox(height: 5),
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  backgroundImage: NetworkImage(newsDisplay?.userImg ?? ""),
                  radius: 15,
                ),
                const SizedBox(height: 5),
                Text(
                  newsDisplay?.author ?? "",
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff888888)),
                ),
                const SizedBox(height: 16),
                Text(
                  newsDisplay?.date ?? "",
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      color: Color(0xffB8B8B8)),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Image.asset('image/Icons (1).png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('image/Icons (2).png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('image/Icons (3).png'),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Summary",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  newsDisplay?.summary ?? "",
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB8B8B8)),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Content",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  newsDisplay?.content ?? "",
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB8B8B8)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
