import 'package:dro_health_pharmacy/data/cart.dart';
import 'package:dro_health_pharmacy/data/product.dart';
import 'package:dro_health_pharmacy/ui/widgets/cart_modal.dart';
import 'package:dro_health_pharmacy/util/util.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {

  final Cart? cart;

  const SuccessDialog({Key? key, this.cart}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 300,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 28,),
                const Text("Successful", style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 15,),
                Text("${cart?.product.name} has been added to your cart", textAlign: TextAlign.center, style: const TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold),),
                const SizedBox(height: 18,),
                // view bag button
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        shape: bottomSheetStyle,
                        context: context,
                        builder: (context) => CartModal(cart: cart!)
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: straightCornerShape,
                    padding: const EdgeInsets.all(0),
                    fixedSize: const Size(400, 60),
                    primary: Colors.teal,
                  ),
                  child: const Text('View Bag',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                const SizedBox(height: 18,),
                // done button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: straightCornerShape,
                    padding: const EdgeInsets.all(0),
                    fixedSize: const Size(400, 60),
                    primary: Colors.teal,
                  ),
                  child: const Text('Done',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top:0,
              right: 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                    color: Colors.white,
                  // border: Border.all(
                  //   color: Colors.white,
                  //   width: 2
                  // )
                ),
                  child: const Icon(Icons.check_circle, color: Colors.teal, size: 58,))
          )
        ],
      ),
    );
      
  }

}
