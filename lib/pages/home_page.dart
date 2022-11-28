import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/grocery_item_tile.dart';
import '../model/cart_model.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: Icon(Icons.shopping_bag),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            //good morning
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Good morning,',
                style: TextStyle(fontSize: 18),
              ),
            ),

            SizedBox(height: 4),
            //let's order fresh items for you
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Let's order fresh items for you!",
                  style: GoogleFonts.notoSerif(
                      fontSize: 32, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 24),
            //divider
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(thickness: 2),
            ),

            const SizedBox(height: 24),

            //fresh items + grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Fresh Items:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),

            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () => {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index),
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
