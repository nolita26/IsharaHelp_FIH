import 'package:flutter/material.dart';
import 'package:frugal_project1/HomePage.dart';
import 'package:frugal_project1/ThemeColor.dart';

class CameraPage extends StatelessWidget {

  late double width;

  Widget _header(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)
      ),
      child: Container(
        height: 130,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/logo_black.png', height: 160, width: 160,),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: kThemeColor,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30.0,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => new HomePage())
                              );
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage('assets/logo_black.png'),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("ISHARA HELP", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 20.0,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new ListTile(
                      leading: Icon(Icons.assignment, color: kYellowColor, size: 22,),
                      title: new Text('Disclaimer', style: TextStyle(color: Colors.black, fontSize: 16),),
                      onTap: () {
                        // Navigator.push(context, new MaterialPageRoute(
                        //     builder: (context) => new Settings())
                        // );
                      },
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  _header(context),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Camera",
                      style: TextStyle(
                          color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )));
  }
}