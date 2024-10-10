@JS('Telegram.WebApp')
library telegram_web_app;

import 'package:js/js.dart';

@JS('initData')
external String get initData;

@JS('initDataUnsafe')
external dynamic get initDataUnsafe;

@JS('colorScheme')
external String get colorScheme;

@JS('themeParams')
external dynamic get themeParams;

@JS('MainButton')
external MainButton get mainButton;

@JS('close')
external void close();

@JS()
class MainButton {
  external void show();
  external void hide();
  external void setText(String text);
  external void onClick(Function callback);
}
