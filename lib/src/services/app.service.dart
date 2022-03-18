import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AppService {
  static AppService? _instance;

  AppService._internal();

  factory AppService() => _instance ??= AppService._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BehaviorSubject<int> homePageIndex = BehaviorSubject<int>();

  changeHomePageIndex({int index = 0}) async {
    homePageIndex.add(index);
  }
}
