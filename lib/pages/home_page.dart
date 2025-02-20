import 'package:flutter/material.dart';
import '../model/article_model.dart';
import '../model/category_model.dart';
import '../model/category_news.dart';
import '../services/data.dart';
import '../services/news.dart';
import '../services/show_category_news.dart';
import '../widget/category_explore.dart';
import 'category_news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool loading = true;
  @override
  void initState() {
    categories = getCategories();
    getNews();
    super.initState();
  }


  getNews() async{
    News newClass = News();
    await newClass.getNews();
    articles = newClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title app
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: articles.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 3, left: 5, right: 8),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    articles[index].urlToImage!,
                                    width: MediaQuery.of(context).size.width/2,
                                    fit: BoxFit.cover,
                                    height: 150,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: MediaQuery.of(context).size.width/1.8,
                                child: Text(
                                  articles[index].title!,
                                  maxLines: 2,
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
                                width: MediaQuery.of(context).size.width/1.8,
                                child: Text(
                                  articles[index].desc!,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(151, 0, 0, 0),
                                      fontSize: 13
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xff3280ef),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20))
                                ),
                                margin: EdgeInsets.only(left: 139),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                  );
                },
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

