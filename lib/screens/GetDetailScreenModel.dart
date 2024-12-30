import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/postModel.dart';

class WaveBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blue.withOpacity(0.5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 4, size.height,
      size.width / 2, size.height - 30,
    );
    path.quadraticBezierTo(
      size.width * 3 / 4, size.height - 60,
      size.width, size.height - 30,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class PostDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Post post = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          post.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          WaveBackground(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Icon(Icons.bookmark, size: 30, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 2,
                              color: Colors.blue,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  // Post body
                  Text(
                    post.body,
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height:210),
                  // Row for User ID and ID
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoContainer("User ID: ${post.userId}", Colors.blue),
                      _buildInfoContainer("ID: ${post.id}", Colors.green),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoContainer(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}