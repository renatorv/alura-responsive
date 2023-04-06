import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';

import '../components/drink_item.dart';

class DrinkMenu extends StatelessWidget {
  const DrinkMenu({Key? key}) : super(key: key);

  final List items = drinks;

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
                'Bebidas',
                style: TextStyle(fontFamily: "Caveat", fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var item = items[index];
                return DrinkItem(
                  imageURI: item['image'],
                  itemTitle: item['name'],
                  itemPrice: item['price'],
                );
              },
              childCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}
