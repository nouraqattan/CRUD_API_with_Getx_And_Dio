import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../doamin/postsList_Page/postList_Controller.dart';
import '../approutes.dart';

class PostsScreen extends StatelessWidget {
  final PostController postController = Get.find<PostController>();
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 40.0, // Set the width of the circular image
              height: 40.0, // Set the height of the circular image
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8.0), // Space between the image and text
            Text('Get Your Posts'), // Adjusted text
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final result = await Get.toNamed(AppRoutes.addEditPost);
              if (result == true) {
                await postController.fetchPosts();
              }
            },
          ),
        ],
      ),
      body: Obx(() {
        if (postController.isLoading.isTrue) {
          return Center(child: CircularProgressIndicator());
        }

        if (postController.posts.isEmpty) {
          return Center(child: Text("No posts available"));
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey.shade300, Colors.blue.shade100],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    labelText: 'Click to search..',
                    labelStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Colors.transparent, // No border color
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.transparent), // No border color for normal state
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.transparent), // No border color when focused
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8.0), // Space between icon and text
                      child: Icon(Icons.search, color: Colors.black), // Search icon
                    ),
                  ),
                  onChanged: (value) {
                    // Handle search logic here
                  },
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: postController.posts.length,
                  itemBuilder: (context, index) {
                    final post = postController.posts[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.withOpacity(0.4), // Gray color
                            Colors.grey.withOpacity(0.2), // Blue color
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Wrap Text in a Container to get the width for the underline
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(Icons.bookmark_outline_outlined, size: 20),
                                              SizedBox(width: 8.0),
                                              Expanded( // Use Expanded to prevent overflow
                                                child: Text(
                                                  post.title,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    overflow: TextOverflow.ellipsis, // Handle overflow
                                                   // maxLines: 1, // Limit to 1 line
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 4.0), // Space between title and underline
                                        // Container for the underline
                                        Container(
                                          height:1.0, // Height of the underline
                                          color: Colors.black, // Color of the underline
                                          width: post.title.length * 8.0,
                                          alignment: Alignment.centerLeft, // Align to the left
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 40.0, // Set the width of the container
                                  height: 40.0, // Set the height of the container
                                  decoration: BoxDecoration(
                                    color: Colors.white, // Background color of the button
                                    shape: BoxShape.circle, // Make it circular
                                    border: Border.all(color: Colors.red, width: 2.0), // Red border
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.edit, color: Colors.black, size: 22), // Icon color and size
                                    onPressed: () async {
                                      final result = await Get.toNamed(AppRoutes.addEditPost, arguments: post);
                                      if (result == true) {
                                        await postController.fetchPosts();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0), // Spacing between title and body
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.postDetail, arguments: post); // Navigate to post detail
                                },
                                child:
                            Text(post.body)),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  postController.deletePost(post.id);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}