import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/utils/custom_appbar.dart';
import 'package:shopping_app/utils/util.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Details",
        isSearchIconVisible: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              widget.product['title'] as String,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image(
              image: AssetImage(widget.product['imageUrl'] as String),height: 250,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$ ${widget.product['price'] as double}",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = index;
                            });
                          },
                          child: Chip(
                            backgroundColor: selectedSize == index
                                ? Theme
                                .of(context)
                                .colorScheme
                                .primary
                                : const Color.fromRGBO(245, 247, 249, 1),
                            label: Text(
                                "${(widget.product['sizes'] as List<
                                    int>)[index]}"),
                            labelStyle: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      context.read<CartProvider>().addProduct(
                          getNewCartItem(widget.product, (widget
                              .product['sizes'] as List)[selectedSize]));
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Item added Successfully")));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme
                          .of(context)
                          .primaryColor,
                      minimumSize: const Size(350, 50),
                    ),
                    label: Text(
                      "Add to Cart",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
