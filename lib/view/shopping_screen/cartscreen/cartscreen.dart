// cart_screen.dart
import 'package:fitness_app/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Box<Cartmodel> cartBox;

  @override
  void initState() {
    super.initState();
    cartBox = Hive.box<Cartmodel>('cartBox');
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in cartBox.values) {
      total += (item.price ?? 0) * (item.quantity ?? 1);
    }
    return total;
  }

  void removeItem(int key) {
    cartBox.delete(key);
  }

  void incrementQuantity(int key) {
    Cartmodel? item = cartBox.get(key);
    if (item != null) {
      item.quantity = (item.quantity ?? 1) + 1;
      cartBox.put(key, item);
    }
  }

  void decrementQuantity(int key) {
    Cartmodel? item = cartBox.get(key);
    if (item != null && (item.quantity ?? 1) > 1) {
      item.quantity = (item.quantity ?? 1) - 1;
      cartBox.put(key, item);
    }
  }

  void buyNow() {
    // Implement your Buy Now functionality here
    // For example, clear the cart and show a success message
    cartBox.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Purchase successful!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: cartBox.listenable(),
        builder: (context, Box<Cartmodel> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final key = box.keyAt(index);
                    final Cartmodel? item = box.get(key);

                    if (item == null) return const SizedBox.shrink();

                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              // Product Image
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(item.image ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                
                              ),
                              const SizedBox(width: 15),
                              // Product Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title ?? 'No Title',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '₹${item.price?.toStringAsFixed(2) ?? '0.00'}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // Quantity Selector
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () => decrementQuantity(key),
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Text(
                                          '${item.quantity}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => incrementQuantity(key),
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Delete Button
                              IconButton(
                                onPressed: () => removeItem(key),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Total Price and Buy Now Button
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Total Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '₹${getTotalPrice().toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // Buy Now Button
                    ElevatedButton(
                      onPressed: buyNow,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
