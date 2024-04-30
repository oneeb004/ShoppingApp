
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;

  

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'sizes': selectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product Added Successfully'),
        ),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Select The Size'),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text("Detail")),
      ),
      body: Column(
        children: [
        
          Center(
            child: Text(widget.product ['title'] as String,
            style:const TextStyle(
               fontWeight: FontWeight.bold,
                        fontSize: 35,
            ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl']as String,
            height: 190,
            ),
          
          ),
          const Spacer(flex: 2,),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color:const Color.fromRGBO(249, 248, 250, 1),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('\$${widget.product['price']
                }',
                 style:const TextStyle(
                 fontWeight: FontWeight.bold,
                          fontSize: 35,
                            )
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (widget.product['sizes'] as List<int>).length,
                  itemBuilder: (context,index){
                    final size=(widget.product['sizes'] as List<int>)[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedSize=size; 
                          });
                        },
                        child: Chip(
                          backgroundColor:selectedSize==size? Theme.of(context).colorScheme.primary:const Color.fromRGBO(245, 247, 249, 1),
                          label: Text(size.toString()
                          ),
                                             
                        ),
                      ),
                    );
                }
                ),
              ),
               
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 
                 child: ElevatedButton(onPressed: onTap,
                  child:  const Text("Add to Cart" ,
                  style: TextStyle(color: Colors.black,
                  fontSize: 18,
                  ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  fixedSize: const Size(350,50),
                  ), 
                  ),
               )

              
            ],
            ),


          )
        
        ],
        )
    );

  }
}