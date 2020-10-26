import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://lumiere-a.akamaihd.net/v1/images/homepage_hero_avengers2_mobile_827a8592.jpeg?region=0,0,750,863'),
                        fit: BoxFit.cover),
                  ),
                ),
                Shimmer(
                  gradient: LinearGradient(
                      begin: Alignment(-1, 0.25),
                      end: Alignment(1, -0.25),
                      stops: [
                        0.45,
                        0.5,
                        0.55
                      ],
                      colors: [
                        Colors.white.withOpacity(0),
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0)
                      ]),
                  child: Container(
                    width: 200,
                    height: 300,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Shimmer(
              loop: 2,
              period: Duration(seconds: 5),
              direction: ShimmerDirection.rtl,
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.white, Colors.black],
                  stops: [0.45, 0.5, 0.55],
                  begin: Alignment(-1, 0.25),
                  end: Alignment(1, -0.25)),
              child: Text(
                'Lalisa Manoban',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
