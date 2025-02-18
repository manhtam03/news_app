import 'package:flutter/material.dart';

class StartedPage extends StatefulWidget {
  const StartedPage({super.key});

  @override
  State<StartedPage> createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
                "assets/images/onboard.png",
              height: MediaQuery.of(context).size.height/1.7,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.9),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Get The Latest And Updated News Easily With Us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
