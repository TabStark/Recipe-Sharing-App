import 'package:flutter/material.dart';

class CustomPageRouter extends PageRouteBuilder {
  final Widget child;

  CustomPageRouter({required this.child})
      : super(
            transitionDuration: Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) => child);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }
}
