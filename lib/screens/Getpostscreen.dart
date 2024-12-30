import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../naivigation_manager/approutes.dart';
import '../domain/postsList_Page/postList_Controller.dart';

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
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Text('Get Your Posts'),
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
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.search, color: Colors.black),
                    ),
                  ),
                  onChanged: (value) {

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
                            Colors.blue.withOpacity(0.4),
                            Colors.grey.withOpacity(0.2),
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 5),
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

                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(Icons.bookmark_outline_outlined, size: 20),
                                              SizedBox(width: 8.0),
                                              Expanded(
                                                child: Text(
                                                  post.title,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    overflow: TextOverflow.ellipsis,

                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 4.0),

                                        Container(
                                          height:1.0,
                                          color: Colors.black,
                                          width: post.title.length * 8.0,
                                          alignment: Alignment.centerLeft,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.red, width: 2.0),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.edit, color: Colors.black, size: 22),
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
                            SizedBox(height: 5.0),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.postDetail, arguments: post);
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