import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_sharing_app/main.dart';
import 'package:recipe_sharing_app/subscribe.dart';
import 'favoritepage.dart';
import 'customePagerouter/CustomPageRouter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: Theme.of(context).primaryColorLight,
           automaticallyImplyLeading: false,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 693,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(70))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/srk.png"),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Text(
                          "Shah Rukh Khan",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Actor, Chef, Entertainer",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 390,
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 30,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "+91-82707 06893",
                                  style: TextStyle(fontSize: 20),
                                ))
                          ],
                        ),
                        // Divider(color: Colors.grey, thickness: 1),
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              size: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("tabrezahmed@gmail.com",
                                  style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        // Divider(color: Colors.grey, thickness: 1),
                        Row(
                          children: [
                            Icon(
                              Icons.payment,
                              size: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Payment",
                                  style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        // Divider(color: Colors.grey, thickness: 1),
                        Row(
                          children: [
                            Icon(
                              Icons.settings,
                              size: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Setting and Privacy",
                                  style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        // Divider(color: Colors.grey, thickness: 1),
                        Row(
                          children: [
                            Icon(
                              Icons.logout,
                              size: 30,
                              color: Colors.red,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Logout",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red)),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Footer
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
                     Navigator.of(context).push(
                          new CustomPageRouter(
                              child: MyHomePage()));
                    },
                    icon: Icon(
                      Icons.home_outlined,
                      size: 40,
                    ),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  IconButton(
                    onPressed: () {
                     Navigator.of(context).push(
                          new CustomPageRouter(
                              child: new FavoritePage()));
                    },
                    icon: Icon(
                      Icons.favorite_outline,
                      size: 35,
                    ),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  IconButton(
                    onPressed: () {
                       Navigator.of(context).push(
                          new CustomPageRouter(
                              child: new MYSubscribe()));
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
                      Icons.account_circle,
                      size: 35,
                    ),
                    color: Theme.of(context).primaryColorLight,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
