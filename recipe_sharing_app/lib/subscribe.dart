import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customePagerouter/CustomPageRouter.dart';
import 'package:recipe_sharing_app/main.dart';
import 'package:recipe_sharing_app/profile.dart';
import 'package:recipe_sharing_app/favoritepage.dart';

class MYSubscribe extends StatelessWidget {
  const MYSubscribe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subscribe"),
        backgroundColor: Theme.of(context).primaryColorLight,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 693,
              width: double.infinity,
              child: Center(child: Text("No Subscribed")),
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
                    onPressed: () {
                      Navigator.of(context).push(
                          new CustomPageRouter(child: new FavoritePage()));
                    },
                    icon: Icon(
                      Icons.favorite_outline,
                      size: 35,
                    ),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_alert,
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
