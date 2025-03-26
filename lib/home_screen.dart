import 'package:api_use/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreeen extends StatefulWidget {
  const ProductScreeen({super.key});

  @override
  State<ProductScreeen> createState() => _ProductScreeenState();
}


class _ProductScreeenState extends State<ProductScreeen> {
  
  @override
  void initState() {
    super.initState();
    var productProvider=Provider.of<ProductController>(context,listen: false);
    productProvider.getProduct();
  }
  @override
  Widget build(BuildContext context) {
    var product=Provider.of<ProductController>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Product Screen'),),
      body: product.productList.isEmpty?Text('No Product Available'):
      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisExtent: 255,
        mainAxisSpacing: 8
      ),
        itemCount: product.productList.length,
        itemBuilder: (context, index) {
        final productIndex=product.productList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            child: Column(
              children: [
                Expanded(child: Image.network(productIndex.image,fit: BoxFit.fill,)),
                Text(productIndex.title)
              ],
            ),
          ),
        );
      },)
    
    );
  }
}
