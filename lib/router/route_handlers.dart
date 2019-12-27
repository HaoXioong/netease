import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:netease/pages/index.dart';
import 'package:netease/pages/login/login.dart';

Handler rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Index();
  }
);

Handler loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginPage();
  }
);

Handler indexHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Index();
  }
);