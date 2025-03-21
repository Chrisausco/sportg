import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';


class Auth with ChangeNotifier{
  String? _token;
  String? _userId;

  Future<void> _signup(String email, String Password) async{
    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAHRbyHvKKLHbQn0QLb_j9QMtylgpYTTQw');


    try{
      final response = await http.post(url, body: json. encode({'email': email, 'password': Password, 'returnSecureToken': true,}),);

      final responseData = json.decode(response.body);

      if(responseData['erro'] != null){
        throw HttpException(responseData['error']);
      }

    } catch(error){
      throw error;
    }


      }
}