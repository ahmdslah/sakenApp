import 'package:jwt_decoder/jwt_decoder.dart';

class CheckEmail {
  bool isEmail(String text) {
    const String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(text);
  }
}

class CheckToken {
  bool isTokenExpired(String token) {
    bool isValid;
    if (token == null || token.split('.').length != 3) {
      isValid = false; // مش JWT أصلاً
    } else {
      isValid = true;
    }

    if (isValid) {
      return JwtDecoder.isExpired(token);
    } else {
      return true;
    }
  }
}
