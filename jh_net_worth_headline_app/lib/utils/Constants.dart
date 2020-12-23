
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///全局常量
class Constants{

  ///数据库名
  static final String sqlDbName='dhjs.oa';


  ///主题色配置
  static final Color primaryColor=Colors.blue;


  ///聊天信息类型
  //文本
  static final String messageTypeText="text";
  //图片
  static final String messageTypePicture="picture";
  //视频
  static final String messageTypeVideo="video";
  //声音
  static final String messageTypeAudio="audio";


  ///支付宝配置
  static const bool ALIPAY_USE_RSA2 = true;
  // 支付/登录
  static const String ALIPAY_APPID = 'your alipay appId';
  // 登录
  static const String ALIPAY_PID = 'your alipay pid';
  // 登录
  static const String ALIPAY_TARGETID = 'your alipay targetId';
  // 支付/登录
  static const String ALIPAY_PRIVATEKEY = 'your alipay rsa private key(pkcs1/pkcs8)';



  ///微信配置
  static const String WECHAT_APPID = 'wx854345270316ce6e';
  // iOS 请配置
  static const String WECHAT_UNIVERSAL_LINK = null;
  static const String WECHAT_APPSECRET = 'ce4c6c4f007cf10baad3f600da16aa8e';
  static const String WECHAT_MINIAPPID = 'gh_wxd930ea5d5a258f4f';

}