import 'package:ct48402/ui/films/film_overview_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // Kích hoạt luồng xác thực
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        //Lấy chi tiết xác thực từ yêu cầu
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Tạo thông tin đăng nhập mới
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        //Sau khi đăng nhập, hãy trả lại UserCredential
        UserCredential result =
            await _auth.signInWithCredential(authCredential);
        User? user = result.user;

        if (result != null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => FilmsOverviewScreen()));
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
