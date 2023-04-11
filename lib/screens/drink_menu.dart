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
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: MediaQuery.of(context).orientation == Orientation.landscape ? 1.2 : 158/194, // divide altura pela largura 100/100 = 1
            ),
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
