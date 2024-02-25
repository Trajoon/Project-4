import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key? key,
    required this.image,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String image;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Image.asset(image),
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: 260,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  text2,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ],
            ),
          ),
         // const SizedBox(width: 90),
          Image.asset('image/arrow-forward-circle-outline.png'),
        ],
      ),
    );
  }
}
