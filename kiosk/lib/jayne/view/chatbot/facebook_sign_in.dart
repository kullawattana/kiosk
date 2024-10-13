import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInDemo extends StatefulWidget {
  const FacebookSignInDemo({super.key});

  @override
  State<FacebookSignInDemo> createState() => _FacebookSignInDemoState();
}

class _FacebookSignInDemoState extends State<FacebookSignInDemo> {
  Map<String, dynamic>? _userData;
  AccessToken? accessToken;

  Future<void> _loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      accessToken = result.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
      setState(() {
        _userData = userData;
      });
    } else {
      debugPrint(result.status.toString());
      debugPrint(result.message.toString());
    }
  }

  Future<void> _logout() async {
    await FacebookAuth.instance.logOut();
    setState(() {
      _userData = null;
      accessToken = null;
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
