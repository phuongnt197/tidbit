import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodImgMainView extends StatelessWidget {
  const FoodImgMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'images/calories.svg',
          // height: 50.0,
        ),
        const Padding(padding: EdgeInsets.all(20)),
        Container(
          width: 304,
          height: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            color: Color(0xff00b195),
          ),
          child: const Center(
            child: Text(
              "Protein food suggestion:\nChicken, egg, nuts and seeds",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: 73,
                  height: 68,
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      size: 60,
                      color: Color(0xff00b195),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  width: 119,
                  child: Text(
                    "Take a pic of your food ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Cabin",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 73,
                  height: 68,
                  child: IconButton(
                    icon: const Icon(
                      Icons.draw_rounded,
                      size: 60,
                      color: Color(0xff00b195),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  width: 119,
                  child: Text(
                    "Input your food",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Cabin",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
