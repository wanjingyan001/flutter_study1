import 'package:flutter/material.dart';

class HeroAnimationRouteA extends StatelessWidget {
  static const String routeName = "/HeroAnimation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("头像"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
              tag: "avatar",
              child: ClipOval(
                child: Image.asset(
                  "assets/as_background.jpeg",
                  width: 50,
                  height: 50,
                ),
              )),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: PageScaffold(
                  title: "原图",
                  body: HeroAnimationRouteB(),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

class PageScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  PageScaffold({this.title, @required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title != null ? title : "PageScaffold"),
      ),
      body: body,
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Hero(tag: "avatar", child: Image.asset("assets/as_background.jpeg")),
    );
  }
}
