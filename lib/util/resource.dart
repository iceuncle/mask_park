import 'package:flutter/material.dart';
import 'package:maskpark/intl/stock_string.dart';

import 'my_colors.dart';

///资源文件
var myResource = MyResource();

class MyResource {
  MyResource._internal();

  static MyResource _singleton = new MyResource._internal();

  factory MyResource() => _singleton;

  List getMainTabs(BuildContext context) => [
        {
          "image": "images/home.png",
          "activeImage": "images/home_light.png",
          "name": Strings.of(context).home,
        },
        {
          "image": "images/transceiver.png",
          "activeImage": "images/transceiver_light.png",
          "name": Strings.of(context).transceiver,
        },
        {
          "image": "images/new.png",
          "activeImage": "images/new_light.png",
          "name": Strings.of(context).news,
        },
        {
          "image": "images/mine.png",
          "activeImage": "images/mine_light.png",
          "name": Strings.of(context).mine,
        }
      ];

  List getPersonTabs(BuildContext context) => [
        {
          "image": "images/evaluation.png",
          "activeImage": "images/evaluation.png",
          "name": Strings.of(context).evaluation,
        },
        {
          "image": "images/chat.png",
          "activeImage": "images/chat.png",
          "name": Strings.of(context).chat,
        },
        {
          "image": "images/microphone.png",
          "activeImage": "images/microphone.png",
          "name": Strings.of(context).microphone,
        }
      ];

  List getTransceiverGridIcons(BuildContext context) => [
        {
          'title': Strings.of(context).exercise,
          'image': AssetImage('images/10_exercise.png'),
        },
        {
          'title': Strings.of(context).social,
          'image': AssetImage('images/10_social.png'),
        },
        {
          'title': Strings.of(context).foodie,
          'image': AssetImage('images/10_foodie.png'),
        },
        {
          'title': Strings.of(context).movie,
          'image': AssetImage('images/10_movie.png'),
        },
        {
          'title': Strings.of(context).game,
          'image': AssetImage('images/10_game.png'),
        },
        {
          'title': Strings.of(context).travel,
          'image': AssetImage('images/10_travel.png'),
        },
        {
          'title': Strings.of(context).shopping,
          'image': AssetImage('images/10_shopping.png'),
        },
        {
          'title': Strings.of(context).chat,
          'image': AssetImage('images/10_chat.png'),
        }
      ];

  List getMineGridIcons(BuildContext context) => [
        {
          "name": Strings.of(context).information,
          "image": AssetImage("images/15_information.png"),
        },
        {
          "name": Strings.of(context).wallet,
          "image": AssetImage("images/15_wallet.png"),
        },
        {
          "name": Strings.of(context).like,
          "image": AssetImage("images/15_like.png"),
        },
      ];

  List getTransceiverItemTabs(BuildContext context) => [
        {
          "name": "0",
          "image": AssetImage('images/praise_light.png'),
          "color": MyColors.grey,
        },
        {
          "name": Strings.of(context).comment,
          "image": AssetImage("images/comment.png"),
          "color": MyColors.grey,
        },
        {
          "name": Strings.of(context).join,
          "image": AssetImage("images/sign_up.png"),
          "color": MyColors.grey,
        },
        {
          "name": Strings.of(context).close,
          "image": AssetImage("images/close_light.png"),
          "color": MyColors.theme,
        },
      ];
}
