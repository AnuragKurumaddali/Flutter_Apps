import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/utils/custom_appbar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Cart",
        isSearchIconVisible: false,
      ),
      body: cart.isNotEmpty
          ? ListView.builder(
              itemCount: cart.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final cartItem = cart[index];
                return ListTile(
                  title: Text(
                    cartItem['title'] as String,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text("Shoe Size : ${cartItem['size'] as int}",
                      style: Theme.of(context).textTheme.bodySmall),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              "Delete",
                            ),
                            content: Text(
                              "Are you sure you want to delete the item from the cart?",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("No",style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold,),),),
                              TextButton(
                                  onPressed: () {
                                    context.read<CartProvider>().removeProduct(cartItem);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Yes",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,),))
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            )
          : const Center(child: Text("CartPage is empty!")),
    );
  }
}
