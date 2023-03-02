import 'package:flutter/material.dart';
import 'package:frugal_project1/DashboardPage.dart';
import 'package:frugal_project1/Drawer/ContactUs.dart';
import 'package:frugal_project1/HomePage.dart';
import 'package:frugal_project1/ThemeColor.dart';

class Discalimer extends StatelessWidget {

  late double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
          title: Text('Disclaimer'),
          centerTitle: true
        ),
        body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 40),
                  Image.asset('assets/logo_white.png', height: 300, width: 300,),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Disclaimer",
                            style: TextStyle(
                                color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Ishara Help is meant for the disabled people in Uganda and is solely for the purpose of efficient communication for the disabled people with others. Uganda Sign Language (USL) is the official language in Uganda for the deaf. It has been a challenge to teach USL to the 3.4% of Uganda’s deaf population due to lack of frugal USL learning methods. We provide a digital way of understanding USL through Ishara Help!",
                          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
