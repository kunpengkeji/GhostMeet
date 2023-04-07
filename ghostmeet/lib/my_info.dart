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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          onPressed: () {
            // TODO: 点击设置按钮后的操作
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://pbs.twimg.com/profile_banners/1498198918672580608/1654770878/1500x500'),
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
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          _showModalBottomSheet(context);
                        },
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://fibochain.s3-ap-east-1.amazonaws.com/0/wKOO2rOtkNrxhVfT0aj8r94SW_tmp_870525ef9a03377a350c7f292254e1d93cad76897e73187d.jpg',
                          ),
                          radius: 50,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Ed',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Flutter Developer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'New York, USA',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
