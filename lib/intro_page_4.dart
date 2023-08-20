import 'package:flutter/material.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: 900,
                width: 500,
                child: Image.asset('assets/images/fourth.png',
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
                            Text('Get Discounts', style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),),
                            Text('On All Prouducts', style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),),
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
