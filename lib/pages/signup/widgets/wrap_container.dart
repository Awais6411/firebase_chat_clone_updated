import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWrapContainer extends StatelessWidget {
  final String img;
  const MyWrapContainer({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromARGB(255, 220, 228, 224).withOpacity(0.5),
          image: DecorationImage(image: AssetImage(img),fit: BoxFit.cover)),
    );
  }
}
