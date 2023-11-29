import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  double _deviceHeight = 0;
  double _deviceWidth = 0;
  late TextEditingController _searchTextFeildController;

  @override
  Widget build(BuildContext context, WidgetRef watch) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    _searchTextFeildController = TextEditingController();
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _backgroundWidget(),
              _foregroundWidget(),
            ],
          ),
        ));
  }

  Widget _backgroundWidget() {
    return Container(
        height: _deviceHeight,
        width: _deviceWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(
              "https://th.bing.com/th/id/R.6894d2775f1298b1fce72a90e2fac4a8?rik=ZG%2bTOlflwm%2faqg&pid=ImgRaw&r=0",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
          ),
        ));
  }

  Widget _foregroundWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, _deviceHeight * 0.02, 0, 0),
      width: _deviceWidth * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topbarWidget(),
        ],
      ),
    );
  }

  Widget _topbarWidget() {
    return Container(
      height: _deviceHeight * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchFeildWidget(),
        ],
      ),
    );
  }

  Widget _searchFeildWidget() {
    final _border = InputBorder.none;
    return Container(
        width: _deviceWidth * 0.50,
        height: _deviceHeight * 0.05,
        child: TextField(
          controller: _searchTextFeildController,
          onSubmitted: (_input) {},
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              focusedBorder: _border,
              border: _border,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white24,
              ),
              hintStyle: TextStyle(color: Colors.white54),
              filled: false,
              fillColor: Colors.white24,
              hintText: 'Search....'),
        ));
  }
}
