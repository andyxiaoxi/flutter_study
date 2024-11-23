import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScrollExample extends StatefulWidget {
  const TestScrollExample({super.key});

  @override
  State<TestScrollExample> createState() => _TestScrollExampleState();
}

class _TestScrollExampleState extends State<TestScrollExample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: buildChild(),
    );
  }
}

Widget buildChild() {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            background: ColoredBox(
              color: Colors.green,
            ),
            title: Text('Demo'),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 4,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (index % 9)],
              child: Text('Grid Item $index'),
            );
          }, childCount: 20),
        ),
        SliverFixedExtentList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            }),
            itemExtent: 50)
        //SliverList(delegate: delegate),
      ],
    ),
  );
}
