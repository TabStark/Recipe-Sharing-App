import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_sharing_app/profile.dart';
import 'package:recipe_sharing_app/provider/favoriteProvider.dart';
import 'secondPage.dart';
import 'favoritepage.dart';
import 'provider/favoriteProvider.dart';
import 'subscribe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FavoriteProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColorLight: Color.fromARGB(255, 248, 2, 117)),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _item = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _item = data['item'];
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Sharing"),
        backgroundColor: Theme.of(context).primaryColorLight,
        automaticallyImplyLeading: false,
      ),

      // body
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Menu Bar
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 45,
                    width: 320,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Search Recipe",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 248, 2, 117)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 248, 2, 117)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 248, 2, 117),
                              width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: 70,
                    child: TextButton(
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColorLight,
                        size: 40,
                      ),
                      onPressed: () {},
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                    ),
                  )
                ],
              ),
            ),

            // Main Body
            Container(
                padding: EdgeInsets.all(20),
                height: 633,
                width: double.infinity,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        height: 220,
                        width: 180,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 243, 244, 243),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(blurRadius: 20, color: Colors.grey)
                            ]),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Description(
                                        person: new Person(
                                            '${_item[index]['id']}'))));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${_item[index]['photos']}"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "${_item[index]['name']}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        provider.toggleFavorite(
                                            '${_item[index]['id']}');
                                      },
                                      icon: provider
                                              .isExist('${_item[index]['id']}')
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            )
                                          : const Icon(Icons.favorite_border))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 50,
                        color: Colors.white,
                      );
                    },
                    itemCount: _item.length)),
            //  Footer
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(blurRadius: 3, color: Colors.grey),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.home,
                      size: 40,
                    ),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new CupertinoPageRoute(
                              builder: (context) => new FavoritePage()));
                    },
                    icon: Icon(
                      Icons.favorite_outline,
                      size: 35,
                    ),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new CupertinoPageRoute(
                              builder: (context) => new MYSubscribe()));
                    },
                    icon: Icon(
                      Icons.add_alert_outlined,
                      size: 35,
                    ),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new CupertinoPageRoute(
                              builder: (context) => new ProfilePage()));
                    },
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 35,
                    ),
                    color: Theme.of(context).primaryColorLight,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Person {
  final String passIndex;
  Person(this.passIndex);
}
