import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intouch/ui/loginPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          LoginPage(),
          LoginPage(),
          LoginPage(),
        ],
        controller: pageController,
        physics: BouncingScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: (pageNumber == 0)
                  ? Color(
                      0xffec6f66,
                    )
                  : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: (pageNumber == 1)
                  ? Color(
                      0xffec6f66,
                    )
                  : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: (pageNumber == 2)
                  ? Color(
                      0xffec6f66,
                    )
                  : Colors.grey,
            ),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: pageNumber,
      ),
    );
  }

  void onPageChanged(int pageNumber) {
    setState(() {
      this.pageNumber = pageNumber;
    });
  }

  void navigationTapped(int pageNumber) {
    pageController.jumpToPage(pageNumber);
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
