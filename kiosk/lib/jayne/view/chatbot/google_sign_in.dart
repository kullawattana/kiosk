import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInDemo extends StatefulWidget {
  const GoogleSignInDemo({super.key});

  @override
  _GoogleSignInDemoState createState() => _GoogleSignInDemoState();
}

class _GoogleSignInDemoState extends State<GoogleSignInDemo> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign In Demo'),
      ),
      body: Center(
        child: user != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    leading: GoogleUserCircleAvatar(identity: user),
                    title: Text(user.displayName ?? ''),
                    subtitle: Text(user.email),
                  ),
                  ElevatedButton(
                    onPressed: _handleSignOut,
                    child: const Text('Sign Out'),
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: _handleSignIn,
                child: const Text('Sign In with Google'),
              ),
      ),
    );
  }
}
