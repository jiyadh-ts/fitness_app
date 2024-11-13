// Screenthree.dart
import 'package:fitness_app/Dummydb.dart';
import 'package:fitness_app/model/cartmodel.dart';
import 'package:fitness_app/view/shopping_screen/cartscreen/cartscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class Screenthree extends StatefulWidget {
  const Screenthree({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<Screenthree> createState() => _ScreenthreeState();
}

class _ScreenthreeState extends State<Screenthree> {
  late Map<String, dynamic> product;
  late Box<Cartmodel> cartBox;

  @override
  void initState() {
    super.initState();
    product = Dummydb.fitnessProducts[widget.index];
    cartBox = Hive.box<Cartmodel>('cartBox');
  }

  void addToCart() {
    // Check if the product is already in the cart
    final existingItem = cartBox.values.firstWhere(
      (item) => item.id == product['id'],
      orElse: () => Cartmodel(),
    );

    if (existingItem.id != null) {
      // If exists, increment quantity
      existingItem.quantity = existingItem.quantity! + 1;
      cartBox.put(existingItem.id, existingItem);
    } else {
      // Else, add new item
      cartBox.add(Cartmodel(
        id: product['id'],
        title: product['title'],
        des: product['description'],
        price: product['price'].toDouble(),
        quantity: 1,
        image: product['image'],
      ));
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Container(
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(product["image"]),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Product Title
              Text(
                product["title"],
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // Rating
              Row(
                children: [
                  Icon(Icons.star, size: 25, color: Colors.yellow[700]),
                  const SizedBox(width: 4),
                  Text(
                    "${product["rating"]}/5",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    "(45 reviews)",
                    style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Description
              const Text(
                "Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                product["description"],
                style: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              // Choose Size
              const Text(
                "Choose Size",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  sizeOption("S"),
                  const SizedBox(width: 10),
                  sizeOption("M"),
                  const SizedBox(width: 10),
                  sizeOption("L"),
                ],
              ),
               SizedBox(height: 20),
              // Price and Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Price",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "₹${product["price"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  // Add to Cart and Buy Now Buttons
                  Row(
                    children: [
                      // Add to Cart
                      InkWell(
                        onTap: addToCart,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_bag_rounded, color: Colors.white),
                              SizedBox(width: 10),
                              Text(
                                "Add to Cart",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Buy Now
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Buy Now clicked')),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.payment, color: Colors.white),
                              SizedBox(width: 10),
                              Text(
                                "Buy Now",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sizeOption(String size) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 2, color: Colors.grey),
      ),
      child: Center(
        child: Text(
          size,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
