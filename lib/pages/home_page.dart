import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cars',
          style: TextStyle(fontFamily: 'Jost', color: Colors.red, fontSize: 25),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // #categories
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    singleTab(true, 'All'),
                    singleTab(false, 'Red'),
                    singleTab(false, 'Blue'),
                    singleTab(false, 'White'),
                    singleTab(false, 'Green'),
                    singleTab(false, 'Yellow'),
                    singleTab(false, 'Black'),
                    singleTab(false, 'Grey'),
                  ],
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              // #makeItem
              makeItem('assets/images/im_car5.jpg', 'Ferrari', '100\$', 'Electric'),
              makeItem('assets/images/im_car4.png', 'Ferrari', '100\$', 'Electric'),
              makeItem('assets/images/im_car3.jpg', 'Ferrari', '100\$', 'Electric'),
              makeItem('assets/images/im_car2.jpg', 'Ferrari', '100\$', 'Electric'),
              makeItem('assets/images/im_car1.jpg', 'Ferrari', '100\$', 'Electric'),
            ],
          ),
        ),
      ),
    );
  }

  Widget singleTab(bool type, String text) {
    return AspectRatio(
      aspectRatio: 2.2 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: type ? Colors.red : Colors.white),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Jost',
                fontSize: type ? 19 : 15,
                color: type ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  makeItem(String image, String name, String price, String module) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.black54, blurRadius: 10, offset: Offset(0, 10))
          ]),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.5),
              Colors.black.withOpacity(.3),
              Colors.black.withOpacity(.1),
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 25, color: Colors.white, fontFamily: 'Jost'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      module,
                      style: const TextStyle(
                          color: Colors.red, fontFamily: 'Jost', fontSize: 18),
                    )
                  ],
                ),
                Text(
                  price,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 25, fontFamily: 'Jost'),
                ),
              ],
            ),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red
              ),
              child: const Center(
                child: Icon(Icons.favorite_border, color: Colors.white,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
