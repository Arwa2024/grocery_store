import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final String images = 'assets/images/grapes.png';
  int selectedButton =2;
  void selectButton (int buttonIndex){
    selectedButton =buttonIndex;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF4F5F9) ,
        elevation: 0,
        leading: IconButton(onPressed: ()=>Navigator.of(context).pop(),icon: Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Image(
            image: AssetImage('assets/images/lime.png'),
          ),
            Text('\$7',style: TextStyle(
              color: Color(0xff6CC51D))),
            Text('Lemons',style: TextStyle(
      color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20)),
            SizedBox(
              height: 10,
            ),
            Text("Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on"
                " the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing.",style: TextStyle(
                color: Color(0xff868889),
                fontSize: 15)),

            Spacer(),
       Row(
         children: [
           Container(
             height: 60,
             width: 150,
             decoration: const BoxDecoration(
                 shape: BoxShape.rectangle,
                 gradient: LinearGradient(colors: [
                   Color(0xffAEDC81),
                   Color(0xff6CC518)
                 ]),
                 borderRadius: BorderRadius.all(
                     Radius.circular(8))),
             child: MaterialButton(
               onPressed: () {
                 selectButton(1);
               },
               child: const Padding(
                 padding: EdgeInsets.all(5),
                 child: Row(
                   mainAxisAlignment:
                   MainAxisAlignment.center,
                   children: [
                     Text(
                       'Resell',
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 20,
                           fontWeight: FontWeight.w400),
                     )
                   ],
                 ),
               ),
             ),
           ),
           Spacer(),
           Container(
             height: 60,
             width: 150,
             decoration: const BoxDecoration(
                 shape: BoxShape.rectangle,
                 gradient: LinearGradient(colors: [
                   Color(0xffAEDC81),
                   Color(0xff6CC518)
                 ]),
                 borderRadius: BorderRadius.all(
                     Radius.circular(8))),
             child: MaterialButton(
               onPressed: () {
               },
               child: const Padding(
                 padding: EdgeInsets.all(5),
                 child: Row(
                   mainAxisAlignment:
                   MainAxisAlignment.center,
                   children: [
                     Text(
                       'Add To Cart',
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 20,
                           fontWeight: FontWeight.w400),
                     )
                   ],
                 ),
               ),
             ),
           ),
         ],
       )
          ],
        ),
      ),
    );
  }
}
