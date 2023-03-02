import 'package:flutter/services.dart';
import 'package:frugal_project1/DashboardPage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:frugal_project1/bookmark_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookmarkBloc(), // ← create/init your state model
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ishara Help',
        home: SplashScreen(),
        )
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState() {
    _mockCheckForSession().then((status) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => DashboardPage()
          )
      );
    });
    super.initState();
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Opacity(
                  opacity: 1.0,
                  child: Image.asset('assets/logo_black.png', width: 140.0, height: 140.0,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}