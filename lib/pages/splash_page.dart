import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({
    required Key key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SpalshPageState();
  }
}

class _SpalshPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1))
        .then((_) => widget.onInitializationComplete());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/logo.png'),
            )),
          ),
        ));
  }
}
