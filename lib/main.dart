import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:netease/router/application.dart';
import 'package:netease/router/router.dart';
import 'package:netease/pages/index.dart';

void main() {
  runApp(
    MyApp()
  );

} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Index(),
    );
  }
}