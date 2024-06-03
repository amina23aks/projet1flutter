import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projet1flutter/widgets/BottomCartSheet.dart';
import 'package:projet1flutter/widgets/HomeBottomNavBar.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class ItemPage extends StatefulWidget {
  final String name;
  final String subTitle;
  final String price;
  final String image;

  ItemPage({
    required this.name,
    required this.subTitle,
    required this.price,
    required this.image,
  });

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  List<String> favoriteItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F9FD),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF475269).withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Color(0xFF475269),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        favoriteItems.add(widget.name);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added to Favorites'),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F9FD),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF475269).withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: MediaQuery.of(context).size.height * 0.43,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 230,
                    width: 230,
                    margin: EdgeInsets.only(top: 20, right: 70),
                    decoration: BoxDecoration(
                      color: Color(0xFF475269),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Image.asset(
                    "images/${widget.image}",
                    height: 350,
                    width: 350,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFF5F9FD),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF475269).withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF475269),
                          ),
                        ),
                        Text(
                          "\$${widget.price}",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemSize: 20,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, _) => Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        ),
                        onRatingUpdate: (index) {},
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.subTitle,
                      style: TextStyle(
                        color: Color(0xFF475269),
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "A timeless classic, the ${widget.name} combines elegance with functionality. Its hallmark feature is the date window at 3 o'clock magnified by the Cyclops lens.",
                      style: TextStyle(
                        color: Color(0xFF475269),
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Size:",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF475269),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 10),
                        Row(
                          children: [
                            for (int i = 31; i < 3; i++)
                              Container(
                                height: 35,
                                width: 35,
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F9FD),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF475269).withOpacity(0.3),
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  i.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                     Container(
      color: Color(0xFFF5F9FD),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            decoration: BoxDecoration(
              color: Color(0xFF475269),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF475269).withOpacity(0.3),
                  blurRadius : 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  "Add  To Cart",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  CupertinoIcons.cart_badge_plus,
                  color: Colors.white,
                  size: 32,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            decoration: BoxDecoration(
              color: Color(0xFF475269),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF475269).withOpacity(0.3),
                  blurRadius : 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: InkWell(
                 onTap: () {
              showSlidingBottomSheet(context, builder: (context){
              return SlidingSheetDialog(
               elevation: 8,
               cornerRadius: 16,
               builder: (context, state) {
                 return BottomCartSheet();
               },
              );
              }
              );
            },
              child: Icon(
                Icons.shopping_bag,
                color: Colors.white,
                size: 45,
              ),
            ),
          ),
        ],
      ),

    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(favoriteItems: favoriteItems),
    );
  }
}
