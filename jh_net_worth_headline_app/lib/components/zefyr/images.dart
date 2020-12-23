// Copyright (c) 2018, the Zefyr project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zefyr/zefyr.dart';

/// Custom image delegate used by this example to load image from application
/// assets.
class CustomImageDelegate implements ZefyrImageDelegate<ImageSource> {
  @override
  ImageSource get cameraSource => ImageSource.camera;

  @override
  ImageSource get gallerySource => ImageSource.gallery;

  @override
  Future<String> pickImage(ImageSource source) async {
    final file = await ImagePicker.pickImage(source: source);
    if (file == null) return null;
    // 模拟后台返回图片地址
    String requestUrl =
        'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=25462226,492036088&fm=26&gp=0.jpg';
    return requestUrl;
  }

  @override
  Widget buildImage(BuildContext context, String key) {
    return new InkWell(
      child: new Hero(
        tag: "avatar$key",
        child: Image.network(
          key,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        Navigator.push(context, PageRouteBuilder(pageBuilder:
            (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
          return new FadeTransition(
            opacity: animation,
            child: HeroAnimationRouteB(key),
          );
        }));
      },
    );
    // if (key.startsWith('asset://')) {
    //   final asset = AssetImage(key.replaceFirst('asset://', ''));
    //   return Image(image: asset);
    // } else if (key.startsWith('file://')) {
    //   final file = File.fromUri(Uri.parse(key));
    //   final image = FileImage(file);
    //   return Image(image: image);
    // } else {
    //   return new InkWell(
    //     child: new Hero(
    //       tag: "avatar$key",
    //       child: Image.network(
    //         key,
    //         width: MediaQuery.of(context).size.width,
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     onTap: () {
    //       Navigator.push(context, PageRouteBuilder(pageBuilder:
    //           (BuildContext context, Animation animation,
    //               Animation secondaryAnimation) {
    //         return new FadeTransition(
    //           opacity: animation,
    //           child: HeroAnimationRouteB(key),
    //         );
    //       }));
    //     },
    //   );
    // }
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  final String img;
  final List<dynamic> photos;
  final String tagAdd;

  HeroAnimationRouteB(this.img, [this.tagAdd = '', this.photos]);

  HeroAnimationRouteB.builder(this.photos, [this.tagAdd, this.img]);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Scaffold(
        body: new Center(
          child: new Hero(
            tag: "avatar$img$tagAdd",
            child: new Image.network(
              img,
              // width: winWidth(context),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      onTap: () => Navigator.of(context).pop(),
    );
  }
}
