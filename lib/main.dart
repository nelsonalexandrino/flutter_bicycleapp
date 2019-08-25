import 'package:flutter/material.dart';

import './models/product.dart';
import './utils/style.dart';
import './pagedetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var product = products[0];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 500,
              width: double.infinity,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double width = constraints.maxWidth;
                  double height = constraints.maxHeight;

                  return Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Hero(
                          tag: 'bg',
                          child: Container(
                            width: width * .9,
                            height: height * .75,
                            color: Color(0xFFFFC5C5),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product.type,
                              style: AppStyle.appbarStyle,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              product.name,
                              style: AppStyle.headingStyle,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: height * .32,
                        left: -50,
                        child: Hero(
                          tag: product.name,
                          child: Image.asset(
                            product.imageUrl,
                            width: 370,
                            height: 350,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Amazing Speed',
                    style: AppStyle.headingStyle2,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Incredible power',
                    style: AppStyle.headingStyle2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'The top fuel 9.9 XX1 is built for speed and capability on any terrein',
                    style: AppStyle.descStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 22),
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailPage(product: product)));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
