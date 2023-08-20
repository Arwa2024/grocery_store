import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AboutUs extends StatelessWidget {
  const AboutUs ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us',style: TextStyle(
            fontSize: 20,
            color: Color(0xff6CC51D),
            fontWeight: FontWeight.w600),),
        backgroundColor: Color(0xffF4F5F9) ,
        elevation: 0,
        leading: IconButton(onPressed: ()=>Navigator.of(context).pop(),icon: Icon(Icons.arrow_back,color: Colors.black,)),
      ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Text('Our Mission',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),),
                SizedBox(height: 10.0),
                Text(
                  'Our mission is to provide our customers with the best possible grocery shopping experience. We offer a wide variety of products at competitive prices, and we make it easy for our customers to find what they need. We also offer a variety of delivery and pickup options to make it convenient for our customers to get their groceries.',
                  style: TextStyle(fontSize: 16.0,
                   color:Color(0xff868889)),
                ),
                SizedBox(height: 20.0),
                Text('Our Team',style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),),
                SizedBox(height: 10.0),
                Text(
                  'We are a team of passionate people who are committed to providing our customers with the best possible experience. We are always looking for ways to improve our service, and we are always happy to hear feedback from our customers.',
                  style: TextStyle(fontSize: 16.0,
                      color:Color(0xff868889)),
                ),
                SizedBox(height: 20.0),
                Text('Contact Us',style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),),
                SizedBox(height: 10.0),
                Text(
                  'If you have any questions or feedback, please do not hesitate to contact us. We are always happy to help.',
                  style: TextStyle(fontSize: 16.0,
                      color:Color(0xff868889)),
                ),
              ],
            ),
          ),
        ),
    );
  }
}