import 'package:flutter/material.dart';

import '../cardapio.dart';
import '../components/highlight_item.dart';

class Highlights extends StatelessWidget {
  const Highlights({Key? key}) : super(key: key);

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'Destaques',
                style: TextStyle(fontFamily: "Caveat", fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          MediaQuery.of(context).orientation == Orientation.landscape ? const LandScapeList() : const PortraitList(),
        ],
      ),
    );
  }
}

class PortraitList extends StatelessWidget {
  const PortraitList({Key? key}) : super(key: key);

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: items.length,
        (context, index) {
          var item = items[index];
          return HighlightItem(
            imageURI: item["image"],
            itemTitle: item["name"],
            itemPrice: item["price"],
            itemDescription: item["description"],
          );
        },
      ),
    );
  }
}

class LandScapeList extends StatelessWidget {
  const LandScapeList({Key? key}) : super(key: key);

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var item = items[index];
          return HighlightItem(
            imageURI: item["image"],
            itemTitle: item["name"],
            itemPrice: item["price"],
            itemDescription: item["description"],
          );
        },
        childCount: items.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
    );
  }
}
