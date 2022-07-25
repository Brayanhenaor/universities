import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universities/models/colleges_response.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CollegesResponse college = Get.arguments['college'];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final mH = constraints.maxHeight;
          final mW = constraints.maxWidth;
          return Stack(
            children: [
              Positioned(
                top: 0,
                child: Hero(
                  tag: college.name,
                  child: Image(
                    height: mH * 0.6,
                    fit: BoxFit.cover,
                    image: const NetworkImage(
                        'https://media.gq.com.mx/photos/607dc9cf7a5da02e8a3dbb6d/master/pass/universidades%20harvard-1209892117.jpg'),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: mH * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 30,
                    right: 30,
                    bottom: 20,
                  ),
                  width: mW,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          college.name,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          college.country,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        const Text(
                          'Deserunt magna cupid ex. Dolor minim ex sunt nostrud. Id veniam cupidatat aliquip dolore consectetur exercitation. Commodo eu culpa cillum cupidatat pariatur nisi pariatur ea officia elit id aute mollit. Tempor cillum voluptate qui nisi non veniam velit voluptate sunt deserunt.',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '33,748',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2B924E)),
                                ),
                                Text(
                                  'number of students',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                    color: const Color(0xff2B924E)
                                        .withOpacity(0.4),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  fixedSize: const Size(80, 80),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  primary: const Color(0xff2B924E),
                                  padding: const EdgeInsets.all(15),
                                ),
                                child: const Text(
                                  'Set up a visit',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
