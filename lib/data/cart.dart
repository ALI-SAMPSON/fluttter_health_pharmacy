import 'package:dro_health_pharmacy/data/product.dart';

class Cart{
  final Product product;
  late final int quantity;

  Cart({required this.product, required this.quantity});

}

List<Cart> cartList = [

  Cart(
      product:  Product(
        name : "Kezitil Susp.",
        subName: "Cefuroxime Axetil",
        grams: "125mg",
        category: "Oral suspension",
        price : "820",
        currency: "₦",
        thumbNailUrl: "assets/images/product-1.png",
      ),
      quantity: 1
  ),

  Cart(
      product:  Product(
        name : "Kezitil.",
        subName: "Cefuroxime Axetil",
        grams: "250mg",
        category: "Tablet",
        price : "1540",
        currency: "₦",
        thumbNailUrl: "assets/images/product-2.png",
      ),
      quantity: 1
  ),

  Cart(
      product: Product(
        name : "Garlic Oil",
        subName: "Garlic Oil",
        grams: "650mg",
        category: "Soft Gel",
        price : "385",
        currency: "₦",
        thumbNailUrl: "assets/images/product-3.png",
      ),
      quantity: 1
  ),

  Cart(
      product:  Product(
        name : "Folic Acid (100).",
        subName: "Folic Acid ",
        grams: "5mg",
        category: "Tablet",
        price : "170",
        currency: "₦",
        thumbNailUrl: "assets/images/product-4.png",
      ),
      quantity: 1
  ),

  Cart(
      product:  Product(
        name : "Pure Green Tea",
        subName: "Green Tea",
        grams: "5mg",
        category: "Bag",
        price : "100",
        currency: "₦",
        thumbNailUrl: "assets/images/product-5.jpg",
      ),
      quantity: 1
  ),

  Cart(
      product:  Product(
        name : "Folic Acid (100).",
        subName: "Folic Acid ",
        grams: "5mg",
        category: "Tablet",
        price : "170",
        currency: "₦",
        thumbNailUrl: "assets/images/product-6.jpg",
      ),
      quantity: 1
  ),

];