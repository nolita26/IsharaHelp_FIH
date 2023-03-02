import 'package:frugal_project1/Drawer/ContactUs.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frugal_project1/DashboardPage.dart';
import 'package:frugal_project1/Drawer/Disclaimer.dart';
import 'package:frugal_project1/SignsList.dart';
import 'package:frugal_project1/ThemeColor.dart';
import 'package:just_audio/just_audio.dart';
import 'package:frugal_project1/bookmark_model.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  late double width;
  late AudioPlayer player;

  List<Map<String, dynamic>> _foundSigns = [];

  @override
  void initState() {
    _foundSigns = entries;
    player = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = entries;
    } else {
      results = entries
          .where((sign) =>
          sign["signname"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundSigns = results;
    });
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
                  ListTile(
                    leading: Icon(Icons.home, color: kYellowColor, size: 22,),
                    title: new Text('Home', style: TextStyle(color: Colors.black, fontSize: 16),),
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new DashboardPage())
                      );
                    },
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                  ),
                  ListTile(
                    leading: Icon(Icons.assignment, color: kYellowColor, size: 22,),
                    title: new Text('Disclaimer', style: TextStyle(color: Colors.black, fontSize: 16),),
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new Discalimer())
                      );
                    },
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                  ),
                  ListTile(
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
        title: Text("Search for Signs", style: TextStyle(color: Color(0xFFFFBF00)),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
            child: Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 55,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: kContainerColor,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: TextField(
                          onChanged: (value) => _runFilter(value),
                          decoration: const InputDecoration(
                            hintText: 'Search for signs...',
                            suffixIcon: Icon(Icons.search, color: Colors.black,),
                            iconColor: Colors.black
                          ),
                        ),
                      )
                  ),
                  const SizedBox(height: 7,),
                  Expanded(
                    child: _foundSigns.isNotEmpty ? GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3/3,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 10,
                      ),
                      itemCount: _foundSigns.length,
                      key: UniqueKey(),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onDoubleTap: () {
                            showDialog(
                              context: context, 
                              builder: (BuildContext context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        _foundSigns[index]["signname"].toString(),
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(30),
                                      child: Image.asset(
                                        'assets/signs/${_foundSigns[index]["signlogo"].toString()}'),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        IconButton(
                                            onPressed: () async {
                                              await player.setAsset(
                                                  'assets/audio/${_foundSigns[index]["signaudio"].toString()}');
                                              player.play();
                                            },
                                            icon: Icon(Icons.volume_up, color: Colors.black,)
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              if(entries[index]['status'] == "false" && _foundSigns[index]['status'] == "false") {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('Added to Bookmarks!'),
                                                      duration: const Duration(seconds: 4),
                                                    ));

                                                SignsList itemModel = new SignsList(
                                                    signname: _foundSigns[index]['signname'],
                                                    signlogo: _foundSigns[index]['signlogo'],
                                                    signaudio: _foundSigns[index]['signaudio'],
                                                    status: _foundSigns[index]['status']
                                                );

                                                bookmarkBloc.addItems(itemModel);

                                                print(bookmarkBloc.items[index].signname);
                                                print(bookmarkBloc.items.length);

                                                setState(() {
                                                  entries[index]['status'] = "true";
                                                  _foundSigns[index]['status'] = "true";
                                                });
                                              } else {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('Removed from Bookmarks!'),
                                                      duration: const Duration(seconds: 4),
                                                    ));
                                                setState(() {
                                                  entries[index]['status'] = "false";
                                                  _foundSigns[index]['status'] = 'false';
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
                          child: Card(
                            key: ValueKey(_foundSigns[index]["signname"].toString()),
                            elevation: 0,
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
                                      'assets/signs/${_foundSigns[index]["signlogo"].toString()}', height: 80),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                      child: Center(
                                        child: Text(
                                            _foundSigns[index]["signname"].toString(),
                                          style: TextStyle(fontSize: 15),),
                                      )
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      IconButton(
                                          onPressed: () async {
                                            await player.setAsset(
                                                'assets/audio/${_foundSigns[index]["signaudio"].toString()}');
                                            player.play();
                                          },
                                          icon: Icon(Icons.volume_up, color: Colors.black,)
                                      ),
                                      IconButton(
                                          onPressed: (){
                                            if(entries[index]['status'] == "false" && _foundSigns[index]['status'] == "false") {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text('Added to Bookmarks!'),
                                                    duration: const Duration(seconds: 4),
                                                  ));

                                              SignsList itemModel = new SignsList(
                                                  signname: _foundSigns[index]['signname'],
                                                  signlogo: _foundSigns[index]['signlogo'],
                                                  signaudio: _foundSigns[index]['signaudio'],
                                                  status: _foundSigns[index]['status']
                                              );

                                              bookmarkBloc.addItems(itemModel);

                                              print(bookmarkBloc.items[index].signname);
                                              print(bookmarkBloc.items.length);

                                              setState(() {
                                                entries[index]['status'] = "true";
                                                _foundSigns[index]['status'] = "true";
                                              });
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text('Removed from Bookmarks!'),
                                                    duration: const Duration(seconds: 4),
                                                  ));
                                              setState(() {
                                                entries[index]['status'] = "false";
                                                _foundSigns[index]['status'] = "false";
                                              });
                                            };
                                          },
                                          highlightColor: Colors.black,
                                          icon: entries[index]['status'] == "false" && _foundSigns[index]['status'] == "false"
                                              ? Icon(Icons.bookmark_border)
                                              : Icon(Icons.bookmark, color: Colors.black)
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                        : Center(
                    child: Image.asset('assets/logo_blurr.png', height: 250, width: 250,),
                    ),
                  )
                ]
            ),
        ),
    );
  }
}
