import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Request location permission
                var permissionStatus = await Permission.location.request();
                if (permissionStatus.isDenied) {
                  return;
                }

                // Get current location
                var position = await Geolocator.getCurrentPosition();

                print('Location: ${position.latitude}, ${position.longitude}');
              },
              child: Text('搜索附近的人'),
            ),
          ],
        ),
      ),
    );
  }
}
