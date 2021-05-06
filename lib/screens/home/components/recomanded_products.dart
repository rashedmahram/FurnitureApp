import 'package:flutter/material.dart';
import 'package:furnitureapp/models/Product.dart';
import 'package:furnitureapp/screens/details/details_screen.dart';
import 'package:furnitureapp/screens/home/components/product_card.dart';

import '../../../size_config.dart';

class RecomandedScroller extends StatelessWidget {
  const RecomandedScroller({
    Key key,
    this.products,
  }) : super(key: key);
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(product: products[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
