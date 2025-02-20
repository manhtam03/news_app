import 'package:flutter/material.dart';
import '../pages/article_view_page.dart';

class CategoryDetail extends StatelessWidget {
  final image, title, desc, url;
  const CategoryDetail({super.key, this.image, this.title, this.desc, this.url,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleViewPage(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
              ),
            ),
            SizedBox(height: 5,),
            SizedBox(
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
      ),
    );
  }
}
