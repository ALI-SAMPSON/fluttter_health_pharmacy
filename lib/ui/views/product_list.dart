
import 'package:dro_health_pharmacy/data/product.dart';
import 'package:dro_health_pharmacy/ui/views/product_detail_page.dart';
import 'package:dro_health_pharmacy/ui/widgets/product_item.dart';
import 'package:dro_health_pharmacy/util/colors.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final _searchTextController = TextEditingController();

  bool _isSearchVisible = false;

  List<Product> _products = [];
  List<Product> _productList = [];
  List<Product> _searchList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _products.addAll(products);
    _productList.addAll(_products);
  }

  // search for a product
  void searchProduct(String keyword){
    if(keyword.isNotEmpty){
      _products.clear();
      _searchList.clear();
      _productList.forEach((product) {
        if(product.name.toUpperCase().contains(keyword.toUpperCase())  || product.name.toLowerCase().contains(keyword.toLowerCase())){
          setState(() {
            _searchList.add(product);
          });
        }
      });
      _products.addAll(_searchList);
    }else{
      _products.clear();
      setState(() {
        _products.addAll(products);
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("125 item(s)", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black87),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){

                },
                child: const CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 18,
                  child: Icon(Icons.compare_arrows_rounded, color: Colors.black87),
                ),
              ),
              const SizedBox(width: 35,),
              GestureDetector(
                onTap: (){

                },
                child: const CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 18,
                  child: Icon(Icons.filter_alt_outlined, color: Colors.black87),
                ),
              ),
              const SizedBox(width: 35,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _isSearchVisible = !_isSearchVisible;
                  });
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 18,
                  child: Icon(Icons.search, color: Colors.black87),
                ),
              ),
            ],
          ),
          Visibility(
            visible: _isSearchVisible,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(left: 14.0, right: 14, top: 5.0, bottom: 5.0),
              child: TextFormField(
                style: const TextStyle(color: colorDroGrey),
                controller: _searchTextController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter search text.';
                  }
                  return null;
                },
                onChanged: (text){
                  searchProduct(text);
                },
                keyboardType: TextInputType.text,
                enabled: true,
                cursorColor: colorDroGrey,
                decoration: InputDecoration(
                  hintText: 'Search here',
                  hintStyle: const TextStyle(
                    color: colorDroGrey,
                    fontWeight: FontWeight.w400,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(color: colorDroGrey, width: 1),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(color: colorDroGrey, width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(color: colorDroGrey, width: 1),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(color: colorDroGrey, width: 1),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(color: colorDroGrey, width: 1),
                  ),
                  prefixIcon: const Icon(Icons.search, color: colorDroGrey),
                  suffixIcon: GestureDetector(
                      onTap: () {

                      },
                      child: const Icon(Icons.close, color: colorDroGrey)),
                ),
              ),
            ),
          ),
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 5.0,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  itemCount:  _products.length,
                  itemBuilder: (context, index){
                    Product product = _products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProductDetailPage(product: product)));
                      },
                        child: ProductItem(product: product)
                    );
                  })
          ),
          // Expanded(
          //   child: ListView.builder(
          //       itemCount: products.length,
          //       physics: const BouncingScrollPhysics(),
          //       itemBuilder: (context, index){
          //       Product product = products[index];
          //       return ProductItem(product: product);
          //   }),
          // ),
        ],
      ),
    );
  }
}
