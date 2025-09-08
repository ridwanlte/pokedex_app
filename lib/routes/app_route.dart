part of 'app_page.dart';

abstract class AppRoute {
  AppRoute._();

  static const MENU = _Paths.MENU;
  static const HOME = _Paths.HOME;
  static const FAVORITE = _Paths.FAVORITE;
}

abstract class _Paths {
  _Paths._();

  static const MENU = '/menu';
  static const HOME = '/home';
  static const FAVORITE = '/favorite';
}
