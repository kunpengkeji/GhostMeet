import 'package:flutter/material.dart';

class Post {
  final String author;
  final String content;
  final String imageUrl;

  Post({required this.author, required this.content, required this.imageUrl});
}

class FriendCirclePage extends StatelessWidget {
  final List<Post> posts = [
    Post(
        author: '小明',
        content: '今天天气不错！',
        imageUrl: 'https://picsum.photos/200'),
    Post(
        author: '小红', content: '好久不见了！', imageUrl: 'https://picsum.photos/201'),
    Post(
        author: '小芳',
        content: '这是一条很长很长很长的帖子，测试一下效果怎么样。',
        imageUrl: 'https://picsum.photos/202'),
    Post(
        author: '小李',
        content: '欢迎来我的新店逛逛！',
        imageUrl: 'https://picsum.photos/203'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('friend'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          Post post = posts[index];
          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/50?random=${index + 1}'),
                  ),
                  title: Text(post.author),
                  subtitle: Text('发布于刚刚'),
                ),
                Image.network(post.imageUrl),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(post.content),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: 添加新的帖子
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
