import 'package:flutter/material.dart';

class MidPart extends StatelessWidget {
  const MidPart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Divider(
          thickness: 0.5,
          height: 0.1,
          color: Color(0xff888888),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Top Stories",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFFFFF)),
            ),
            Text(
              "See all",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff888888)),
            )
          ],
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
