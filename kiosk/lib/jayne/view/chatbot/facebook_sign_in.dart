import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInDemo extends StatefulWidget {
  const FacebookSignInDemo({super.key});

  @override
  _FacebookSignInDemoState createState() => _FacebookSignInDemoState();
}

class _FacebookSignInDemoState extends State<FacebookSignInDemo> {
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;

  Future<void> _loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(); // เริ่มการเข้าสู่ระบบ

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      final userData = await FacebookAuth.instance.getUserData(); // ดึงข้อมูลผู้ใช้
      setState(() {
        _userData = userData;
      });
    } else {
      print(result.status);
      print(result.message);
    }
  }

  Future<void> _logout() async {
    await FacebookAuth.instance.logOut(); // ออกจากระบบ
    setState(() {
      _userData = null;
      _accessToken = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook Sign In Demo'),
      ),
      body: Center(
        child: _userData != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Logged in as: ${_userData!['name']}'),
            Text('Email: ${_userData!['email']}'),
            Image.network(_userData!['picture']['data']['url']),
            ElevatedButton(
              onPressed: _logout,
              child: const Text('Logout'),
            ),
          ],
        )
            : ElevatedButton(
          onPressed: _loginWithFacebook,
          child: const Text('Login with Facebook'),
        ),
      ),
    );
  }
}
