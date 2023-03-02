import 'package:flutter/material.dart';
import 'package:frugal_project1/BookmarkPage.dart';
import 'package:frugal_project1/CameraPage.dart';
import 'package:frugal_project1/HomePage.dart';
import 'package:frugal_project1/InformationPage.dart';
import 'package:frugal_project1/SearchPage.dart';

class DashboardPage extends StatefulWidget {

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState>_scaffoldKey = new GlobalKey<ScaffoldState>();

  int _currentIndex = 0;

  Widget _showPage = new HomePage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return HomePage();
        break;
      case 1:
        return SearchPage();
        break;
      case 2:
        return BookmarkPage();
        break;
      case 3:
        return InformationPage();
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text('No page found', style: TextStyle(fontSize: 30),),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.white,
        child: Center(
          child: _showPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30,),
            activeIcon: Icon(Icons.home, size: 30,),
            label: "",
            // backgroundColor: Colors.grey
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined, size: 30,),
            activeIcon: Icon(Icons.search, size: 30,),
            label: "",
            // backgroundColor: Colors.grey
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined, size: 30,),
            activeIcon: Icon(Icons.bookmark, size: 30,),
            label: "",
            // backgroundColor: Colors.grey
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/s-outlined.png", height: 30, width: 30,),
            activeIcon: Image.asset("assets/s-filled.png", height: 30, width: 30,),
            label: "",
            // backgroundColor: Colors.grey
          ),
        ],
        onTap: (int tappedIndex) {
          setState(() {
            _currentIndex = tappedIndex;
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
    );
  }
}