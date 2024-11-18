import 'dart:convert';

import 'package:courses_eshop_app/common/services/app_http_client.dart';
import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/models/entities.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo {
  static Future<UserCredential> firebaseSignIn(String email, String password) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  static Future<UserLoginResponseEntity> login({LoginRequestEntity? params}) async {
    print(jsonEncode(params));
    var response = await AppHttpClient().post(
      Endpoints.LOGIN,
      queryParameters: params?.toJson(),
    );

    return UserLoginResponseEntity.fromJson(response);
  }
}
