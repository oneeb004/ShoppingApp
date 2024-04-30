import 'package:flutter/material.dart';
import 'package:shop_app/global_varaiable.dart';
import 'package:shop_app/widgets/product_card.dart';
import 'package:shop_app/pages/product_detail_page.dart';


class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFiltered;
   @override
  void initState(){
    super.initState();
    selectedFiltered=filters[0];
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
      const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes \n Collection",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7.0, vertical: 15),
                        child: GestureDetector(
                           onTap: () {
                              setState(() {
                                 selectedFiltered=filter;
                              });
                           },
                          child: Chip(
                            
                            backgroundColor:selectedFiltered==filter? Theme.of(context).colorScheme.primary:const Color.fromRGBO(245, 247, 249, 1),
                            side: const BorderSide(
                              color: Color.fromRGBO(245, 247, 249, 1),
                            ),
                            label: Text(filter),
                            labelStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: size.width>650? GridView.builder(
                
                itemCount: products.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.75,
              ), 
              
              itemBuilder: (context,index){
                final product=products[index];
                 return  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context){
                          return ProductDetailsPage(product: product);
                      },
                      ),
                      );
                    },
                    child: ProductCard(
                      title:  product['title']  as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      backgroundColor: index.isEven? const Color.fromRGBO(216, 240, 253, 1):
                       const Color.fromRGBO(245, 247, 249, 1)
                    ),
                  );
              },
              )
              :ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,index){
                  final product=products[index];
                  return  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context){
                          return ProductDetailsPage(product: product);
                        
                      },
                      ),
                      );
                    },
                    child: ProductCard(
                      title:  product['title']  as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      backgroundColor: index.isEven? const Color.fromRGBO(216, 240, 253, 1):
                       const Color.fromRGBO(245, 247, 249, 1)
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}