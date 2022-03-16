class Product{
  final String name;
  final String subName;
  final String category;
  final String grams;
  final String price;
  final String currency;
  final String thumbNailUrl;

  Product({required this.name, required this.subName, required this.category, required this.grams, required this.price, required this.currency, required this.thumbNailUrl});

}

List<Product> products = [
  Product(
      name : "Kezitil Susp.",
      subName: "Cefuroxime Axetil",
      grams: "125mg",
      category: "Oral suspension",
      price : "820",
      currency: "₦",
      thumbNailUrl: "assets/images/product-1.png",
  ),
  Product(
    name : "Kezitil.",
    subName: "Cefuroxime Axetil",
    grams: "250mg",
    category: "Tablet",
    price : "1540",
    currency: "₦",
    thumbNailUrl: "assets/images/product-2.png",
  ),
  Product(
    name : "Kezitil",
    subName: "Cefuroxime Axetil",
    grams: "500mg",
    category: "Tablet",
    price : "1795",
    currency: "₦",
    thumbNailUrl: "assets/images/product-2.png",
  ),
  Product(
    name : "Garlic Oil",
    subName: "Garlic Oil",
    grams: "650mg",
    category: "Soft Gel",
    price : "385",
    currency: "₦",
    thumbNailUrl: "assets/images/product-3.png",
  ),
  Product(
    name : "Folic Acid (100).",
    subName: "Folic Acid ",
    grams: "5mg",
    category: "Tablet",
    price : "170",
    currency: "₦",
    thumbNailUrl: "assets/images/product-4.png",
  ),
  Product(
    name : "Pure Green Tea",
    subName: "Green Tea",
    grams: "5mg",
    category: "Bag",
    price : "100",
    currency: "₦",
    thumbNailUrl: "assets/images/product-5.jpg",
  ),
  Product(
    name : "Folic Acid (100).",
    subName: "Folic Acid ",
    grams: "5mg",
    category: "Tablet",
    price : "170",
    currency: "₦",
    thumbNailUrl: "assets/images/product-6.jpg",
  ),
  Product(
    name : "Folic Acid (100).",
    subName: "Folic Acid ",
    grams: "5mg",
    category: "Tablet",
    price : "170",
    currency: "₦",
    thumbNailUrl: "assets/images/product-4.png",
  ),
];