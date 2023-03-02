import 'package:flutter/material.dart';
import 'package:frugal_project1/DashboardPage.dart';
import 'package:frugal_project1/Drawer/ContactUs.dart';
import 'package:frugal_project1/Drawer/Disclaimer.dart';
import 'package:frugal_project1/ThemeColor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double width;
  @override
  Widget _header(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
      ),
      child: Container(
        height: 110,
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
                    Image.asset('assets/logo_black.png', height: 90, width: 90,),
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
                                  builder: (context) => new DashboardPage())
                              );
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage('assets/logo_black.png'),
                                  ),
                                  SizedBox(height: 15.0,),
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
                      leading: Icon(Icons.home, color: kYellowColor, size: 22,),
                      title: new Text('Home', style: TextStyle(color: Colors.black, fontSize: 16),),
                      onTap: () {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => new DashboardPage())
                        );
                      },
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                    ),
                    new ListTile(
                      leading: Icon(Icons.assignment, color: kYellowColor, size: 22,),
                      title: new Text('Disclaimer', style: TextStyle(color: Colors.black, fontSize: 16),),
                      onTap: () {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => new Discalimer())
                        );
                      },
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                    ),
                    new ListTile(
                      leading: Icon(Icons.email_rounded, color: kYellowColor, size: 22,),
                      title: new Text('Contact Us', style: TextStyle(color: Color(0xFF000000), fontSize: 16),),
                      onTap: () {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => new ContactUs())
                        );
                      },
                      trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF000000), size: 16,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  _header(context),
                  SizedBox(height: 40),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Welcome!",
                          style: TextStyle(
                              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Know about USL",
                          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Uganda Sign Language (USL) is the official language in Uganda for the deaf. It has been a challenge to teach USL to the 3.4% of Uganda’s deaf population due to lack of frugal USL learning methods. We provide a digital way of understanding USL through Ishara Help!",
                          style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        Image.asset('assets/usl.jpg', height: 450, width: 450,),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}