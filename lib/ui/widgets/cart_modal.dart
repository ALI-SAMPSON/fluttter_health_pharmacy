import 'package:dro_health_pharmacy/data/cart.dart';
import 'package:dro_health_pharmacy/ui/widgets/cart_item.dart';
import 'package:dro_health_pharmacy/util/colors.dart';
import 'package:dro_health_pharmacy/util/util.dart';
import 'package:flutter/material.dart';

class CartModal extends StatefulWidget {

  final Cart cart;

  const CartModal({Key? key, required this.cart}) : super(key: key);

  @override
  _CartModalState createState() => _CartModalState();
}

class _CartModalState extends State<CartModal> {

  Cart? _selectedCartItem;

  bool _showOptions = false;

  late int _quantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quantity = widget.cart.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: colorDarkPurple,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(14.0), topRight: Radius.circular(14.0)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5,),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 12,),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: MediaQuery.of(context).size.width/2 +30,
              margin: const EdgeInsets.only(right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.shopping_bag_outlined, size: 28, color: Colors.white70,),
                      const SizedBox(width: 4,),
                      const Text('Bag',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Text(cartList.length.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text("Tap on an item for add, remove, delete options", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          ),
          const SizedBox(height: 20,),
          // add or remove option
          Visibility(
            visible: _showOptions,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 8, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){

                  },
                      icon: const Icon(Icons.delete_outline_outlined, size: 32, color: Colors.white,)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          if(_quantity > 1) {
                            setState(() => _quantity--);
                          }
                        },
                        child: const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.remove, color: Colors.black,) ,
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Text(_quantity.toString(), style: TextStyle(color: Colors.white, fontSize: 18),),
                      const SizedBox(width: 8,),
                      GestureDetector(
                        onTap: (){
                          setState(() => _quantity++);
                        },
                        child: const CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                          child: Icon(Icons.add, color: Colors.black)
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
              child: ListView.builder(
                itemCount: cartList.length,
                  itemBuilder: (context, index){
                    Cart cart = cartList[index];
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          _showOptions = !_showOptions;
                          _selectedCartItem = cart;
                        });
                      },
                        child: CartItem(cart: cart)
                    );
                  }
              )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 8, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                Text("${widget.cart.product.currency}${calculateTotalValue(cartList).toString()}", style: const TextStyle( fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),)
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 8, bottom: 8.0),
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                shape: circularButtonStyleSolid,
                padding: const EdgeInsets.all(0),
                fixedSize: const Size(400, 50),
                primary: Colors.white,
              ),
              child: const Text('Checkout',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  double calculateTotalValue(List<Cart> cartList){
    var total = 0.0;
    for(var cart in cartList){
      //total += (double.parse(cart.product.price) * cart.quantity);
    }
    return total;
  }
}
