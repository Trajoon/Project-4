import 'package:flutter/material.dart';

class TopPart extends StatelessWidget {
  const TopPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 185,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Image.asset(
          'image/STK156_Instagram_threads_2 1.png',
          fit: BoxFit.fill,
        ),
      ),
      Positioned(
          top: 10, right: 175, child: Image.asset('image/Frame (1).png')),
      Positioned(bottom: 15, right: 20, child: Image.asset('image/Frame.png')),
      const Positioned(
        bottom: 40,
        left: 20,
        child: Text(
          "DJI • Jul 10, 2023",
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 10, color: Color(0xffB8B8B8)),
        ),
      ),
      const Positioned(
        bottom: 15,
        left: 20,
        child: Text(
          "A month with DJI Mini 3 Pro",
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFFFF)),
        ),
      )
    ]);
  }
}
