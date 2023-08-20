import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: 900,
                width: 500,
                child: Image.asset('assets/images/first.png',
                    fit: BoxFit.fill)
            ),
            Column(
              children: [
                Container(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    ],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text('Welcome to', style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),),
                            Image(image: AssetImage('assets/images/bigCart.png')),
                            Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff868889),

                              ),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
