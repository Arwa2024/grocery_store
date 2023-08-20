import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavBar(initialIndex: 1,),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('category').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> category) {
                  if (category.hasError) {
                    return const Text('Error fetching data');
                  }
                  if (category.connectionState == ConnectionState.waiting) {
                    return const Text('Loading');
                  }

                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: category.data!.docs.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot document = category.data!.docs[index];
                      return Card(color: Colors.white54,
                        child: Column(
                          children: [
                            Container(
                                width: 100,
                                height: 120,
                                child: Image.asset(document['image'])),
                            Text(document['title']),
                          ],
                        ),
                      );
                    },
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