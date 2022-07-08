import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import './messages_all.dart';

class Strings {
  static Future<Strings> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new Strings();
    });
  }

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  static const LocalizationsDelegate<Strings> delegate =
      _StockStringsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en', ''),
    Locale('zh', ''),
  ];

  String get title => Intl.message('Flutter APP', name: 'title');

  String get home => Intl.message('Home', name: 'home');

  String get transceiver => Intl.message('transceiver', name: 'transceiver');

  String get news => Intl.message('news', name: 'news');

  String get mine => Intl.message('mine', name: 'mine');

  String get release => Intl.message('release', name: 'release');

  String get messageCenter =>
      Intl.message('Message Center', name: 'messageCenter');

  String get pushSettings =>
      Intl.message('Push settings', name: 'pushSettings');

  String get myComment => Intl.message('My Comment', name: 'myComment');

  String get chat => Intl.message('Chat', name: 'chat');

  String get message => Intl.message('Message', name: 'message');

  String get nearby => Intl.message('Nearby', name: 'nearby');

  String get newcomer => Intl.message('Newcomer', name: 'newcomer');

  String get goddess => Intl.message('Goddess', name: 'goddess');

  String get member => Intl.message('Member', name: 'member');

  String get onlineFirst => Intl.message('Online first', name: 'onlineFirst');

  String get information => Intl.message('Information', name: 'information');

  String get wallet => Intl.message('Wallet', name: 'wallet');

  String get like => Intl.message('Like', name: 'like');

  String get certificationCenter =>
      Intl.message('Certification Center', name: 'certificationCenter');

  String get authenticationNow =>
      Intl.message('Authentication now', name: 'authenticationNow');

  String get myBroadcast => Intl.message('My broadcast', name: 'myBroadcast');

  String get myPhoto => Intl.message('My Photo', name: 'myPhoto');

  String get uploadPhotosOrVideos =>
      Intl.message('Upload photos/videos', name: 'uploadPhotosOrVideos');

  String get uploadFirstPhoto =>
      Intl.message('Upload my first photo', name: 'uploadFirstPhoto');

  String get uploadPhotoTip =>
      Intl.message('Only photos/videos can attract men',
          name: 'uploadPhotoTip');

  String get albumPrivacy =>
      Intl.message('Album privacy', name: 'albumPrivacy');

  String get public => Intl.message('public', name: 'public');

  String get blacklist => Intl.message('Blacklist', name: 'blacklist');

  String get set => Intl.message('Set', name: 'set');

  String get privacySettings =>
      Intl.message('Privacy、Messages settings', name: 'privacySettings');

  String get shareApp =>
      Intl.message('Share App Name to friends', name: 'shareApp');

  String get needHelp => Intl.message('Need help', name: 'needHelp');

  String get contactCustomerService =>
      Intl.message('Contact Customer Service', name: 'contactCustomerService');

  String get complaintService =>
      Intl.message('Complaint Service', name: 'complaintService');

  String get evaluation => Intl.message('Evaluation', name: 'evaluation');

  String get microphone => Intl.message('Microphone', name: 'microphone');

  String get lowCaseLike => Intl.message('like', name: 'lowCaseLike');

  String get isByInvitationTip => Intl.message(
      'He enters App Name through the invitation code issued by the system',
      name: 'isByInvitationTip');

  String get isRealTip =>
      Intl.message('He authenticates authenticity through facial recognition',
          name: 'isRealTip');

  String get hisActivity => Intl.message('His Activity', name: 'hisActivity');

  String get notPhotoTip =>
      Intl.message('He has not uploaded photo', name: 'notPhotoTip');

  String get height => Intl.message('Height', name: 'height');

  String get residentCity =>
      Intl.message('Resident city', name: 'residentCity');

  String get datingItems => Intl.message('Dating items', name: 'datingItems');

  String get expectation => Intl.message('Expectation', name: 'expectation');

  String get introduction => Intl.message('Introduction', name: 'introduction');

  String get conductTip => Intl.message(
      'Please do not conduct illegal transactions through the\n platform, if it is reported and verified, it will be closed.',
      name: 'conductTip');

  String albumBlockTip1 =
      Intl.message('He set the album lock', name: 'albumBlockTip1');

  String albumBlockTip2 =
      Intl.message('There are %i photos', name: 'albumBlockTip2');

  String albumBlockTip3 = Intl.message('Unlock his photo alblum\n(%iApp %s)',
      name: 'albumBlockTip3');

  String get real => Intl.message('Real', name: 'real');

  String get self => Intl.message('Self', name: 'self');

  String get burnAfterRead =>
      Intl.message('Burn photos\nafter reading', name: 'burnAfterRead');

  String get burned => Intl.message('Burned', name: 'burned');

  String get exercise => Intl.message('Exercise', name: 'exercise');

  String get social => Intl.message('Social', name: 'social');

  String get foodie => Intl.message('Foodie', name: 'foodie');

  String get movie => Intl.message('Movie', name: 'movie');

  String get game => Intl.message('Game', name: 'game');

  String get travel => Intl.message('Travel', name: 'travel');

  String get shopping => Intl.message('Shopping', name: 'shopping');

  String get releaseTime => Intl.message('Release Time', name: 'releaseTime');

  String get anyGender => Intl.message('Any gender', name: 'anyGender');

  String get anyArea => Intl.message('Any area', name: 'anyArea');

  String get oneMinuteAgo => Intl.message('1 minute ago', name: 'oneMinuteAgo');

  String get myPost => Intl.message('My post', name: 'myPost');

  String get comment => Intl.message('Comment', name: 'comment');

  String get join => Intl.message('Join', name: 'join');

  String get close => Intl.message('Close', name: 'close');
}

//Locale代理类
class _StockStringsDelegate extends LocalizationsDelegate<Strings> {
  const _StockStringsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<Strings> load(Locale locale) {
    return Strings.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(_StockStringsDelegate old) => false;
}
