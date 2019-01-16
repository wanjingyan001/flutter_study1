import 'package:flutter/material.dart';

class SliverTestRoute extends StatefulWidget {
  static const String routeName = '/SliverTestRoute';

  @override
  _SliverTestState createState() => _SliverTestState();
}

class _SliverTestState extends State<SliverTestRoute> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          _buildSliverAppBar(),
          _buildSliverToBoxAdapter(),
          _buildSliverGrid(),
          _buildFixedExtentList(),
          _build()
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white.withOpacity(0.5),
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text('SliverDemo'),
        background: Image.asset(
          'assets/as_background.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Container(
        height: 75,
        color: Colors.pinkAccent.withOpacity(0.8),
        child: Center(
          child: Text(
            'SliverToBoxAdapter',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverGrid() {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 10)],
            child: Text('Sliver grid item $index'),
          );
        }, childCount: 9),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 4));
  }

  Widget _buildFixedExtentList() {
    return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 10)],
            child: Text('Sliver fixed extent list item$index'),
          );
        }, childCount: 9),
        itemExtent: 75);
  }

  Widget _build() {
    return SliverFillViewport(
      delegate: SliverChildListDelegate([
        Container(
          height: 50,
          color: Colors.pinkAccent.withOpacity(0.5),
          child: Text(
            'SliverFillViewport1',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Container(
            height: 100,
            color: Colors.lightGreenAccent.withOpacity(0.75),
            child: Text(
              'SliverFillViewport1',
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
        Container(
            height: 75,
            color: Colors.orangeAccent.withOpacity(0.2),
            child: Text(
              'SliverFillViewport1',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))
      ]),
      viewportFraction: 2,
    );
  }
}
