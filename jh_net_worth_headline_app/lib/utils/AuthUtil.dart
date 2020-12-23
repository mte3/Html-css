import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//app鉴权工具类
class AuthUtil {
  //用户token键名
  static String tokenKey="token";
  //用户信息键名
  static String userInfoKey="userinfo";

  //注销登录
  static void logout(BuildContext context) async {
      //服务端token失效
      try{
        //清除token
        await _deleteToken();
        //清除用户信息
        await _deleteUserInfo();
      }catch(e){
        //失败重试
        logout(context);
      }
  }

  //用户登录
  static void login(
      {@required String token,
      @required String userInfo,
      @required BuildContext context}) async {
    //保存token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenKey, token);
    //保存用户信息
    prefs.setString(userInfoKey, userInfo);
  }

  //获取token
  static Future<String> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(tokenKey);
      return token;
    } catch(e){
      return null;
    }
  }

  //获取用户信息
  static Future<String> getUserInfo() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userInfoStr=prefs.getString(userInfoKey);
      return userInfoStr;
    }catch(e){
      return null;
    }
  }


  //更新用户信息
  static Future<bool> updateUserInfo(String userInfo) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(userInfoKey,userInfo);
      return true;
    }catch(e){
      return false;
    }
  }

  //删除token
  static Future<bool> _deleteToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(tokenKey);
      return true;
    } catch(e){
      return false;
    }
  }

  //删除用户信息
  static Future<bool> _deleteUserInfo() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(userInfoKey);
      return true;
    } catch(e){
      return false;
    }
  }

}
