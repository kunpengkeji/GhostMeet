import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatelessWidget {
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150.0,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('打开相机'),
                onTap: () async {
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.getImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    // TODO: 将图片上传到服务器或进行其他操作
                  }
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('从相册选择'),
                onTap: () async {
                  // 打开相册，选择一张照片
                  final imagePicker = ImagePicker();
                  final pickedFile =
                      await imagePicker.getImage(source: ImageSource.gallery);

                  // 如果用户已经选择了一张照片，则将其保存到本地，并显示在界面上
                  if (pickedFile != null) {
                    // TODO: 将照片保存到本地，并显示在界面上
                  }

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  final List<int> data = List.generate(30, (_) => Random().nextInt(30));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://fibochain.s3-ap-east-1.amazonaws.com/0/wKOO2rOtkNrxhVfT0aj8r94SW_tmp_870525ef9a03377a350c7f292254e1d93cad76897e73187d.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.2),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50),
                    Align(
                      alignment:
                          Alignment.center, // set alignment to bottom center
                      child: InkWell(
                        onTap: () {
                          _showModalBottomSheet(context);
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 20), // add some top padding
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://fibochain.s3-ap-east-1.amazonaws.com/0/wKOO2rOtkNrxhVfT0aj8r94SW_tmp_870525ef9a03377a350c7f292254e1d93cad76897e73187d.jpg',
                            ),
                            radius: 50,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        child: Text("Ed"),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              child: Text("Message deleted"),
            ),
          ),
          Center(
            child: Container(
              width: 300,
              height: 240,
              child: GridView.count(
                crossAxisCount: 7,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: List.generate(30, (index) {
                  final count = data[index % data.length];
                  final color = Color.lerp(
                    Colors.white,
                    Colors.green[900]!,
                    count / 30,
                  )!;
                  final size = count / 30 * 40;
                  return Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
