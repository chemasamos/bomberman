import 'package:flutter/material.dart';
import 'package:reproductor_musica/button.dart';
import 'package:reproductor_musica/pixel.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numberOfSquares = 130;
  int playerPosition = 0;
  List<int> barriers = [
    11,13,15,17,18,
    31,33,35,37,38,
    51,53,55,57,58,
    71,73,75,77,78,
    91,93,95,97,98,
    111,113,115,117,118,
  ];

  List<int> boxes = [
    12,14,16,28,21,41,61,81,101,112,114,116,119,127,123,103,83,63,63,65,67,47,39,19,1,30,50,70,121,100,96,79,99,107,7,3
  ];

  void moveUp() {
    setState(() {
      if  (playerPosition - 10 >= 0 && 
      !barriers.contains(playerPosition - 10) && !boxes.contains(playerPosition - 10)) {
        playerPosition -= 10;
      }
    });
  }

  void moveLeft() {
    setState(() {
      if (!(playerPosition % 10 == 0) && !barriers.contains(playerPosition - 1) && !boxes.contains(playerPosition - 1)) {
        playerPosition -= 1;
      }
    });
  }

  void moveRight() {
    setState(() {
     if (!(playerPosition % 10 == 9) && !barriers.contains(playerPosition + 1) && !boxes.contains(playerPosition + 1)) {
        playerPosition += 1;
      }
    });
  }

  void moveDown() {
    setState(() {
      if  (playerPosition + 10 < numberOfSquares && !barriers.contains(playerPosition + 10) && !boxes.contains(playerPosition + 10)) {
        playerPosition += 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: numberOfSquares,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10),
                    itemBuilder: (BuildContext context, int index) {
                      if (playerPosition == index) {
                        return MyPixel(
                          color: Colors.white);
                      } else if (barriers.contains(index)) {
                        return MyPixel(
                          color: Colors.black,
                        );
                      } else if (boxes.contains(index)) {
                        return MyPixel(
                          color: Colors.brown,
                        );
                      } else {
                        return MyPixel(
                          child: Text(index.toString()),
                            color: Colors.grey);
                      }
                      }),                    
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton(),
                        MyButton(
                          function: moveUp,
                          color: Colors.grey,
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 70,
                          ),
                        ),
                        MyButton(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton(
                          function: moveLeft,
                          color: Colors.grey,
                          child: Icon(
                            Icons.arrow_left,
                            size: 70,
                          ),
                        ),
                        MyButton(
                          color: Colors.grey,
                          child: Image.asset('lib/images/CtCenter.png'),
                        ),
                        MyButton(
                          function: moveRight,
                          color: Colors.grey,
                          child: Icon(
                            Icons.arrow_right,
                            size: 70,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton(),
                        MyButton(
                          function: moveDown,
                          color: Colors.grey,
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 70,
                          ),
                        ),
                        MyButton(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
