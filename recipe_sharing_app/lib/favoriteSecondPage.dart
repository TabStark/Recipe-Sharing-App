import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:recipe_sharing_app/favoritepage.dart';
import 'package:recipe_sharing_app/main.dart';
import 'package:recipe_sharing_app/provider/favoriteProvider.dart';
import 'package:provider/provider.dart';

class favoriteDescription extends StatefulWidget {
  final secondPerson person;
  const favoriteDescription({Key? key, required this.person}) : super(key: key);

  @override
  State<favoriteDescription> createState() => _favoriteDescriptionState();
}

class _favoriteDescriptionState extends State<favoriteDescription> {
  String numb = "";
  List tempItem = [];
  int count = 0;
  List item = [];
  Future<void> myreadJson() async {
    final String nresponse = await rootBundle.loadString('assets/sample.json');
    final ndata = await json.decode(nresponse);
//
    setState(() {
      item = ndata['item'];
      tempItem = item[count]['recipe'];
    });
  }

  @override
  void initState() {
    myreadJson();
    numb = widget.person.passIndex;
    count = int.parse(numb);
    super.initState();
  }

  Color _favIconColor = Colors.grey;
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
        // APP Bar
        appBar: AppBar(
          title: const Text("Recipe Sharing"),
          backgroundColor: Theme.of(context).primaryColorLight,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        // Body
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 1000,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.amber,
                  child: Image(
                    image: AssetImage("${item[count]['photos']}"),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 270,
                    child: Container(
                      // height: 1000,
                      width: 412,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 244, 244, 244),
                              width: 5),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, bottom: 20),
                              child: Text(
                                "${item[count]['name']}",
                                style: const TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Recipe",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "eduta",
                                ),
                              ),
                            ),
                            Container(
                              // color: Colors.amber,
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20, left: 20, right: 20),
                              height: 600,
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return Text(
                                    '${tempItem[index]}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: "eduta",
                                        fontWeight: FontWeight.w300),
                                    textAlign: TextAlign.justify,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(height: 20);
                                },
                                itemCount: tempItem.length,
                              ),
                            )
                          ]),
                    )),
                Positioned(
                    right: 30,
                    top: 290,
                    child: IconButton(
                        onPressed: () {
                          provider.toggleFavorite('${item[count]['id']}');
                        },
                        iconSize: 35,
                        icon: provider.isExist('${item[count]['id']}')
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border)))
              ],
            ),
          ),
        ));
  }
}
