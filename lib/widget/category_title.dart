import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final image, categoryname;
  const CategoryTitle({super.key, this.image, this.categoryname});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: Color(0xb3000000),
              borderRadius: BorderRadius.circular(60),
              )
          ),
          Container(
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
    );
  }
}
