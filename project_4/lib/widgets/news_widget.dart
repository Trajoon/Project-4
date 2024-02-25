import 'package:flutter/material.dart';
import 'package:project_4/screen/display_screen.dart';
import 'package:project_4/model/news.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({super.key, this.news});
  final News? news;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>  DisplayNews(newsDisplay: news,)));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff1E1E1E),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  child: Container(
                    width: 80,
                    height: 62,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Image.network(
                      news?.img ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                 Positioned(
                  top: 10,
                  left: 90,
                  child: Text(
                    news?.author ?? "Sultan",
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff888888)),
                  ),
                ),
                 Positioned(
                  top: 30,
                  left: 90,
                  child: SizedBox(
                    width: 240,
                    height: 46,
                    child: Text(
                      news?.title ?? "GPT",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)),
                    ),
                  ),
                ),
                 Positioned(
                  bottom: 10,
                  child: Text(
                    news?.date ?? "",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 10,
                        color: Color(0xffB8B8B8)),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: 30,
                  child: IconButton(
                    onPressed: () {
                    },
                    icon: Icon(
                      news!.isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: news!.isSaved ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: -10,
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('image/Vector (6).png')),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}


