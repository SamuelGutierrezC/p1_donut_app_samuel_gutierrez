import 'package:flutter/material.dart';
import 'package:p1_donut_app_samuel_gutierrez/utils/pancake_tile.dart';

class PanCakeTab extends StatelessWidget {
  final List pancakesOnSale = [
    ["PanCakeArandano", "20", Colors.blue, "lib/images/PanCakeArandano.png"],
    ["PanCakeCanela", "25", Colors.red, "lib/images/PanCakeCanela.png"],
    ["PanCakeChocolate", "30", Colors.purple, "lib/images/PanCakeChocolate.png"],
    ["PanCakeCoco", "20", Colors.brown, "lib/images/PanCakeCoco.png"],
    ["PanCakeLimon", "25", Colors.orange, "lib/images/PanCakeLimon.png"],
    ["PanCakeMatcha", "30", Colors.green, "lib/images/PanCakeMatcha.png"],
    ["PanCakePlatano", "60", Colors.pink, "lib/images/PanCakePlatano.png"],
    ["PanCakeYogurt", "200", Colors.amber, "lib/images/PanCakeYogurt.png"],
  ];

  final Function(String, double) addToCart;
  final Function(String, double) removeFromCart;
      
    PanCakeTab({
    super.key,
    required this.addToCart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pancakesOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.6),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                // Añadir al carrito al hacer tap
                String name = pancakesOnSale[index][0];
                double price = double.parse(pancakesOnSale[index][1]);
                addToCart(name, price);
              },
              child: PanCakeTile(
                pancakeFlavor: pancakesOnSale[index][0],
                pancakePrice: pancakesOnSale[index][1],
                pancakeColor: pancakesOnSale[index][2],
                imageName: pancakesOnSale[index][3],
              ),
            ),
            // Botones para añadir y eliminar del carrito
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botón de eliminar
                GestureDetector(
                  onTap: () {
                    String name = pancakesOnSale[index][0];
                    double price = double.parse(pancakesOnSale[index][1]);
                    removeFromCart(name, price);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.blue,
                      size: 24,
                    ),
                  ),
                ),
                // Botón de añadir
                GestureDetector(
                  onTap: () {
                    String name = pancakesOnSale[index][0];
                    double price = double.parse(pancakesOnSale[index][1]);
                    addToCart(name, price);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.pink,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}