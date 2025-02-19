import 'package:flutter/material.dart';

class HottestNews extends StatelessWidget {
  const HottestNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 3, left: 5),
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
                    child: Image.asset(
                      'assets/images/news3.jpg',
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
                  width: MediaQuery.of(context).size.width/1.8,
                  child: Text(
                    'Lorem ipsum is simply dummy text of the printing.',
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
  }
}