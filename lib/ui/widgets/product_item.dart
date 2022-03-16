import 'package:dro_health_pharmacy/data/product.dart';
import 'package:dro_health_pharmacy/util/colors.dart';
import 'package:dro_health_pharmacy/util/util.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {

  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shape: roundedCornerShape,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: SizedBox(
              height: 150,
                child: Image.asset(product.thumbNailUrl, fit: BoxFit.cover,))),
            const SizedBox(height: 8.0,),
            Align(
              alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, textAlign: TextAlign.start, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),),
                    Text(product.subName, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: colorDroGrey),),
                    Text("${product.category} - ${product.grams}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500,  color: colorDroGrey),),
                  ],
                )),

            const SizedBox(height: 5.0,),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.only(left: 14.0, right: 14, top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(25),
                  color: colorDroGrey,
                ),
                child: Text("${product.currency}${product.price}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500,  color: Colors.white70),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
