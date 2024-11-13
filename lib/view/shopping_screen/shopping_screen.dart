import 'package:fitness_app/Dummydb.dart';
import 'package:fitness_app/view/shopping_screen/cartscreen/cartscreen.dart';
import 'package:fitness_app/view/shopping_screen/details_page_screen/product_details.dart';
import 'package:flutter/material.dart';

class Shoppingscreen extends StatefulWidget {
  const Shoppingscreen({super.key});

  @override
  State<Shoppingscreen> createState() => _ShoppingscreenState();
}

class _ShoppingscreenState extends State<Shoppingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
                icon: Icon(Icons.shopping_cart)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Our Products",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Dummydb.fitnessProducts.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 280,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final product = Dummydb.fitnessProducts[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Screenthree(index: index)));
                            },
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(product["image"]),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product["title"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "₹${product["price"]}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Dummydb.buildStarRating(product["rating"]),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
