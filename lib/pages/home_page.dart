import 'package:flutter/material.dart';
import '../model/category_model.dart';
import '../services/data.dart';
import '../widget/category_title.dart';
import '../widget/hottestnews_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Buzz',
                  style: TextStyle(
                    color: Color(0xff3280ef),
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Line',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Hottest News',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 320,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HottestNews(),
                  SizedBox(width: 20),
                  HottestNews(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Explore',
              style: TextStyle(
                  color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index){
                  return CategoryTitle(
                    image: categories[index].image,
                    categoryname: categories[index].categoryName,
                  );
                },
              ),
            ),
            Text(
              'Trending News',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                      child: Image.asset('assets/images/news1.jpg', height: 120, width: 120, fit: BoxFit.cover)
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.8,
                        child: Text(
                          'A man very handsome, his name is Manh Tam',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(188, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        width: MediaQuery.of(context).size.width/1.7,
                        child: Text(
                          'Lorem ipsum is simply dummy text of the printing.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(151, 0, 0, 0),
                              fontSize: 13
                          ),
                        ),
                      ),
                    ]
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}

