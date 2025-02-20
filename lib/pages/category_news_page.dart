import 'package:flutter/material.dart';

import '../model/category_news.dart';
import '../services/show_category_news.dart';
import '../widget/category_explore.dart';

class CategoryNews extends StatefulWidget {
  final String name;
  const CategoryNews({super.key, required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool loading = true;

  getNew() async{
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoryNews(widget.name);
    categories = showCategoryNews.categories;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getNew();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3280ef),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/4,),
                  Text(
                      widget.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index){
                    return CategoryDetail(
                      image: categories[index].urlToImage,
                      title: categories[index].title,
                      desc: categories[index].desc,
                    );
                  },
                ),
              ),
            )
          ],
        )
      )
    );
  }
}

class CategoryDetail extends StatelessWidget {
  final image, title, desc;
  const CategoryDetail({super.key, this.image, this.title, this.desc,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              // categories[0].urlToImage!,
            ),
          ),
          SizedBox(height: 5,),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              title,
              style: TextStyle(
                  color: Color.fromARGB(188, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 3,),
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              desc,
              maxLines: 3,
              style: TextStyle(
                  color: Color.fromARGB(151, 0, 0, 0),
                  fontSize: 18
              ),
            ),
          ),
        ],
      ),
    );
  }
}
