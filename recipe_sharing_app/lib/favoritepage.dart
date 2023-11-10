import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recipe_sharing_app/customePagerouter/CustomPageRouter.dart';
import 'package:recipe_sharing_app/main.dart';
import 'package:recipe_sharing_app/profile.dart';
import 'package:recipe_sharing_app/provider/favoriteProvider.dart';
import 'package:recipe_sharing_app/subscribe.dart';
import 'favoriteSecondPage.dart';
import 'customePagerouter/CustomPageRouter.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColorLight: Color.fromARGB(255, 248, 2, 117)),
      home: favoritePageStateless(),
    );
  }
}

class favoritePageStateless extends StatefulWidget {
  const favoritePageStateless({super.key});

  @override
  State<favoritePageStateless> createState() => _favoritePageStatelessState();
}

class _favoritePageStatelessState extends State<favoritePageStateless> {
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
    final words = provider.words;

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
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
                      final word = words[index];
                      final passme = int.parse(word);

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
                                    builder: (context) =>
                                        new favoriteDescription(
                                            person: secondPerson(
                                                '${_item[passme]['id']}'))));
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
                                          "${_item[passme]['photos']}"),
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
                                      "${_item[passme]['name']}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        provider.toggleFavorite(
                                            '${_item[passme]['id']}');
                                      },
                                      icon: provider
                                              .isExist('${_item[passme]['id']}')
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
                    itemCount: words.length)),
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
                    onPressed: () {
                      Navigator.of(context)
                          .push(new CustomPageRouter(child: MyHomePage()));
                    },
                    icon: Icon(
                      Icons.home_outlined,
                      size: 40,
                    ),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
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

class secondPerson {
  final String passIndex;
  secondPerson(this.passIndex);
}
