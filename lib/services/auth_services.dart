import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthServices {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        // إذا لم يتم تسجيل الدخول، ارجع null
        return null;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // تنفيذ تسجيل الدخول باستخدام Firebase
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // تخزين اسم المستخدم
//       var box = await Hive.openBox('USER_BOX');
//       box.put('username', gUser.displayName);
//        box.put('email', gUser.email);
//        box.put('googleToken', gAuth.accessToken);
//        print('Google Token saved: ${gAuth.idToken}');
// print('Access Token: ${gAuth.accessToken}');
// HiveHelper.setValueLoginBox();
//       return userCredential;
    } catch (e) {
      // في حالة وجود خطأ، ارجع null
      print('Google sign-in error: $e');
      return null;
    }
  }
}
