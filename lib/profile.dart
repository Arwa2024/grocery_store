import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_us.dart';
import 'bottom_navigation_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavBar(initialIndex: 2,),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage('https://media.istockphoto.com/id/496516040/vector/muslim-lady.jpg?s=612x612&w=0&k=20&c=TQHy4AESnjrgTxjGUZgzhlwg3-_Le7vUVnI3dyvlj1U='),
              ),
            ),
            Text('Arwa Tawfik',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500
            ), ),
            Text('arwa@test.com',style: TextStyle(
                fontSize: 17,
                )),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10.0),
                Text('+5599955659945498', ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 10.0),
                Text('Egypt, Dakhlia'),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.twitter),
                  onPressed: () {
                    launchUrl(
                        Uri.parse('https://www.facebook.com/profile.php?id=100008877288907'),
                    );
                  },
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  onPressed: () {
                    launchUrl(
                        Uri.parse('https://www.facebook.com/profile.php?id=100008877288907'),
                    );
                  },
                ),

              ],
            ),
            GestureDetector(
              child: const Text(
                'AboutUs',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff6CC51D),
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AboutUs();
                    },
                  ),
                );
              },
            ),

          ],
        ),
      ),

    );
  }
}
