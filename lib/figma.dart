import 'package:flutter/material.dart';
import 'dart:math' as math;

class Figma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Figma Flutter Generator 1homeWidget - FRAME
    return Material(
        type: MaterialType.transparency,
        child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [prog(), prog2()],
              ),
            )));
  }

  Widget prog() {
    // Figma Flutter Generator AnalyticsWidget - FRAME - VERTICAL
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Color(0xffecedef),
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 177,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 177,
                        child: Text(
                          "Your plan \nis almost done! ",
                          style: TextStyle(
                            color: Color(0xff191d30),
                            fontSize: 24,
                            fontFamily: "SF Pro Display",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: 177,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              child: Stack(
                                children: [],
                              ),
                            ),
                            SizedBox(width: 4),
                            SizedBox(
                              width: 161,
                              child: Text(
                                "13% than week ago",
                                style: TextStyle(
                                  color: Color(0xff8c8e97),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  width: 86,
                  height: 86,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 86,
                        height: 86,
                        child: Material(
                          color: Color(0xffe9f3e1),
                          shape: CircleBorder(),
                        ),
                      ),
                      SizedBox(
                        width: 86,
                        height: 86,
                        child: Material(
                          color: Color(0xff67b779),
                          shape: CircleBorder(),
                        ),
                      ),
                      Positioned(
                        left: 55,
                        top: 32,
                        child: Text(
                          "%",
                          style: TextStyle(
                            color: Color(0xff67b779),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: 29,
                        child: Text(
                          "78",
                          style: TextStyle(
                            color: Color(0xff67b779),
                            fontSize: 24,
                            fontFamily: "SF Pro Display",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget prog2() {
    return Container(
      width: 327,
      height: 101,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 327,
                height: 88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color(0xff90dad6),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: 327,
                      height: 88,
                      child: Stack(
                        children: [
                          Container(
                            width: 327,
                            height: 88,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xffacf0c9),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Opacity(
                                opacity: 0.55,
                                child: Container(
                                  width: 200,
                                  height: 236.76,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff1892fa),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Opacity(
                                opacity: 0.70,
                                child: Container(
                                  width: 125,
                                  height: 147.98,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffdeffe5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Opacity(
                                opacity: 0.40,
                                child: Container(
                                  width: 125,
                                  height: 147.98,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff87ef9e),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 32.17,
                            child: Opacity(
                              opacity: 0.30,
                              child: Container(
                                width: 125,
                                height: 147.98,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff4fe8df),
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Opacity(
                                opacity: 0.40,
                                child: Container(
                                  width: 125,
                                  height: 147.98,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffecef87),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 293,
                      top: 12,
                      child: Container(
                        width: 18,
                        height: 18,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff191d30),
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      top: 20,
                      child: Text(
                        "Get vaccinated",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "SF Pro Display",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      top: 48,
                      child: Text(
                        "Nearest vaccination center",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
              width: 100,
              height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: -0.44,
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('images/Ill.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }




}
