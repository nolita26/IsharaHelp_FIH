import 'package:flutter/material.dart';
import 'package:frugal_project1/bookmark_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:frugal_project1/DashboardPage.dart';
import 'package:frugal_project1/Drawer/ContactUs.dart';
import 'package:frugal_project1/Drawer/Disclaimer.dart';
import 'package:frugal_project1/ThemeColor.dart';
import 'package:frugal_project1/SignsList.dart';
import 'package:just_audio/just_audio.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  late double width;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);
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
          title: Text("Signs", style: TextStyle(color: Colors.amber),),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
          key: UniqueKey(),
          children: List.generate(entries.length, (index) {
            return GestureDetector(
              onDoubleTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: new Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            entries[index]["signname"].toString(),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/signs/${entries[index]["signlogo"].toString()}'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                                onPressed: () async {
                                  await player.setAsset(
                                      'assets/audio/${entries[index]["signaudio"].toString()}');
                                  player.play();
                                },
                                icon: Icon(Icons.volume_up, color: Colors.black,)
                            ),
                            IconButton(
                                onPressed: () {
                                  if(entries[index]['status'] == "false") {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Added to Bookmarks!'),
                                          duration: const Duration(seconds: 4),
                                        ));

                                    SignsList itemModel = new SignsList(
                                        signname: entries[index]['signname'],
                                        signlogo: entries[index]['signlogo'],
                                        signaudio: entries[index]['signaudio'],
                                        status: entries[index]['status']
                                    );

                                    bookmarkBloc.addItems(itemModel);

                                    print(bookmarkBloc.items[index].signname);
                                    print(bookmarkBloc.items.length);

                                    setState(() {
                                      entries[index]['status'] = "true";
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Removed from Bookmarks!'),
                                          duration: const Duration(seconds: 4),
                                        ));
                                    setState(() {
                                      entries[index]['status'] = "false";
                                    });
                                  };
                                },
                                highlightColor: Colors.black,
                                icon: entries[index]['status'] == "false"
                                    ? Icon(Icons.bookmark_border)
                                    : Icon(Icons.bookmark, color: Colors.black)
                            )
                          ],
                        )
                      ],
                    ),
                    actions: <Widget>[
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        //textColor: Theme.of(context).primaryColor,
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: kContainerColor,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/signs/${entries[index]["signlogo"].toString()}', height: 100,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 140,
                          padding: EdgeInsets.all(5),
                            child: Center(
                              child: Text(
                                entries[index]["signname"].toString(),
                                style: TextStyle(fontSize: 15),),
                            )
                        ),
                        IconButton(
                            onPressed: () async {
                              await player.setAsset(
                                  'assets/audio/${entries[index]["signaudio"].toString()}');
                              player.play();
                            },
                            icon: Icon(Icons.volume_up, color: Colors.black,)
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      )
    );
  }
}