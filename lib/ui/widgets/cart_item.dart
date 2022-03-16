import 'package:dro_health_pharmacy/data/cart.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {

  final Cart? cart;

  const CartItem({Key? key, this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 80,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(cart!.product.thumbNailUrl),
              backgroundColor: Colors.white,
              radius: 32,
            ),
            Text("${cart!.quantity.toString()}X", style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      title: Text(cart!.product.name, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
      subtitle: Text(cart!.product.category, style: const TextStyle(color: Colors.white60, fontSize: 13),),
      trailing: Text("${cart!.product.currency}${cart!.product.price}", style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),),
    );
  }
}
