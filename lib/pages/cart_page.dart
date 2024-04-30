import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context).cart;
    return   Scaffold(
      appBar: AppBar(
        title:const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder:(context,index){
          final cartItem=cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl']as String),
              radius: 35,
              backgroundColor: Colors.transparent,
            ),
            trailing: IconButton(
              onPressed: (){
                showDialog(
                  barrierDismissible: false,
                  context: context,
                 builder: (context){
                  return AlertDialog(
                    title: Text("Delete Product",
                    style: Theme.of(context).textTheme.titleMedium,
                    ),
                    content: const Text("Are you sure yyou want to remove the product from your cart?"),
                    actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "NO",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "yes",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],

                  );
                }
                );
              },
            icon:const Icon(Icons.delete),
            color: Colors.red,
            
            ),
            title: Text(cartItem['title'].toString(),
            style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text('size :${cartItem['sizes']}'),
          );
        
        } ,
      ),
     
    );
  }
}