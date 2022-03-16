
import 'package:dro_health_pharmacy/data/cart.dart';
import 'package:dro_health_pharmacy/data/product.dart';
import 'package:dro_health_pharmacy/util/colors.dart';
import 'package:dro_health_pharmacy/util/success_dialog.dart';
import 'package:dro_health_pharmacy/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetailPage extends StatefulWidget {

  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  late int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        backgroundColor: Colors.white,
        title: const Text(""),
        actions: [
          Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.only(left: 14.0, right: 14, top: 5.0, bottom: 5.0),
            decoration: BoxDecoration(
              color: colorDroPurple,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              children: const [
                Icon(Icons.shopping_bag_outlined, size: 28,),
                SizedBox(width: 8,),
                Text("3", ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(widget.product.thumbNailUrl, fit: BoxFit.cover,)),
              ),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  textAlign: TextAlign.start,
                  text:  TextSpan(
                      text: widget.product.name,
                      style:  const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n${widget.product.category} - ${widget.product.grams}',
                          style: const TextStyle(
                            color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ]),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 32,
                  ),
                  const SizedBox(width: 20,),
                  RichText(
                    textAlign: TextAlign.start,
                    text:  const TextSpan(
                        text: "SOLD BY",
                        style:  TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nEmazor Pharmaceuticals',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ]),
                  ),
                ],
              ),

              const SizedBox(height: 35,),
              // increment and decrement button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: colorDroGrey)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              if(_quantity > 1) {
                                setState(() => _quantity--);
                              }
                            }, icon: const Icon(Icons.remove, color: Colors.black,)),
                            Text(_quantity.toString(), style: const TextStyle(color: Colors.black, fontSize: 18),),
                            IconButton(onPressed: (){
                              setState(() => _quantity++);

                            }, icon: const Icon(Icons.add, color: Colors.black))
                          ],
                        ),
                      ),
                      const SizedBox(width: 8,),
                      const Text("Pack(s)", style: TextStyle(color: Colors.grey),),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.product.currency, style: const TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 4.0,),
                      Text(widget.product.price, style: const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),

              // Product detail
              const SizedBox(height: 28,),
              const Align(
                alignment: Alignment.topLeft,
                  child: Text("PRODUCT DETAILS", textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),)),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  generateIconText(Icons.backpack_outlined, "PACK SIZE", "3x10"),
                  generateIconText(Icons.qr_code_scanner_rounded, "PRODUCT ID", "PR0BRYVPW1"),
                ],
              ),
              const SizedBox(height: 14,),
              generateIconText(Icons.local_hospital_outlined, "CONSTITUENTS", "Garlic Oil"),
              const SizedBox(height: 14,),
              generateIconText(Icons.delete_outline_outlined, "DISPENSED IN", "PAcks"),


              const SizedBox(height: 50,),
              const Text("1 pack of Garlic Oil cpmtain 3units of 10 Tablet(s)", textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600),),

              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                  onPressed: () {
                    addToCart();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: roundedCornerShape,
                    padding: const EdgeInsets.all(0),
                    fixedSize: const Size(400, 60),
                    primary: colorDroPurple,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add_shopping_cart, size: 24, color: Colors.white70,),
                      SizedBox(width: 20,),
                      Text('Add to bag',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void addToCart(){
    Cart addedProduct = Cart(product: widget.product, quantity: _quantity);
    showDialog(
        context: context,
        builder: (context) => SuccessDialog(cart: addedProduct)
    );
  }


  Widget generateIconText(IconData icon, title, subtitle){
    return Row(
      children: [
        Icon(icon, size: 32, color: colorDroPurple,),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, textAlign: TextAlign.start, style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600),),
            Text(subtitle, textAlign: TextAlign.start, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),)
          ],
        ),
      ],
    );
  }
}
