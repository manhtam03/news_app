import 'package:flutter/material.dart';
import '../pages/category_news_page.dart';

class CategoryExplore extends StatelessWidget {
  final image, categoryname;
  const CategoryExplore({super.key, this.image, this.categoryname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNews(name: categoryname,)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child:Image.asset(
                image,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(60),
                )
            ),
            SizedBox(
              width: 120,
              height: 120,
              child: Center(
                child: Text(
                  categoryname,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
