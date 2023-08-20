
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(initialIndex: 0,),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      children: [
                        IconButton(onPressed: (){},
                            icon: Icon(Icons.search)),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search keywords..',
                              hintStyle: TextStyle(
                                fontSize: 17,
                                  color: Colors.grey
                              )
                            ),
                            onChanged: (value){
                            },

                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Products',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('product').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> product) {
                    if (product.hasError) {
                      return const Text('Error fetching data');
                    }
                    if (product.connectionState == ConnectionState.waiting) {
                      return const Text('Loading');
                    }

                    return Container(
                      decoration: BoxDecoration(
                        border: Border.symmetric(),
                        color: Colors.white
                      ),
                      child: GridView.builder(
                       physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: product.data!.docs.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot document = product.data!.docs[index];
                          return Card(
                            color: Colors.white54,
                            child: Column(
                              children: [
                                Container(
                                  width: 120,
                                    height: 140,
                                    child: Image.asset(document['image'])),
                                Text(document['title'],style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),),
                                SizedBox(height: 8,),
                                Text(document['price'],style: TextStyle(
                                  color: Color(0xff6CC51D),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                                ),),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}