import 'package:flutter/material.dart';
import 'package:fluttertest/page/CarPage.dart';
import 'package:fluttertest/page/HomePage.dart';
import 'package:fluttertest/page/MinePage.dart';

void main() {
  runApp(SXMyApp());
}

class SXMyApp extends StatefulWidget {
  const SXMyApp({Key key}) : super(key: key);

  @override
  _SXMyAppState createState() => _SXMyAppState();
}

class _SXMyAppState extends State<SXMyApp> {
  List<BottomNavigationBarItem> _bottomNavItems;
  List<Widget> _pages;
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('sxmyapp init state');
    _bottomNavItems = [
      BottomNavigationBarItem(
        backgroundColor: Colors.blue,
        icon: Icon(Icons.home),
        label: "首页",
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.amber,
        icon: Icon(Icons.shopping_cart),
        label: "购物车",
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.red,
        icon: Icon(Icons.person),
        label: "个人中心",
      ),
    ];

    _pages = [HomePage(), CarPage(), MinePage()];

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: _bottomNavItems,
          currentIndex: _currentIndex,
          onTap: (v) {
            setState(() {
              _currentIndex = v;
              _pageController.jumpToPage(v);
            });
          },
        ),
        body: PageView.builder(
          onPageChanged: (v) {
            print('改变到了${v}');
          },
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return _pages[index];
          },
          physics: NeverScrollableScrollPhysics(),
        ),

        // body: IndexedStack(
        //   children: pages,
        //   index: currentIndex,
        // ) ,
      ),
    );
  }
}
