import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String imageUrl =
      "https://lh5.googleusercontent.com/proxy/sdVrrPW89fxuHTufgegoz1tFzqZjprNFPPecLa6ZJyCzbDHWKlSCCzN_AMVsklkMHQFgr1gpPUXGEb4GNTBTcunUTCjsO_ImJqGPRMwnjolGkEQC8f6lGS6HQfU3tscghilSBP0okPN-updG044T2dITVo-u6oUSiJFU7pKSKOfr1qO9B-yUCmPaFYvhBYKd1dYRpfhc_fBFatA=w1200-h630-p-k-no-nu";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                accountName: Text("Ritik Rajoria"),
                accountEmail: Text("ritikraj.1306@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
