import 'package:flutter/material.dart';
import 'package:p1_donut_app_samuel_gutierrez/utils/smoothie_tile.dart'; // A, required void Function(String itemName, double itemPrice) removeFromCart, required void Function(String itemName, double itemPrice) addToCartsegúrate de que la ruta sea correcta

class SmoothieTab extends StatelessWidget {
  // Lista de smoothies
  final List smoothiesOnSale = [
    // [ smoothieFlavor, smoothiePrice, smoothieColor, imageName ]
    ["Doble Mora Roja y Azul", "60", Colors.blue, "lib/images/smoothie_doble.png"],
    ["Fresa", "40", Colors.red, "lib/images/smoothie_fresa.png"],
    ["Tropical", "70", Colors.green, "lib/images/smoothie_tropical.png"],
    ["Mango", "35", Colors.orange, "lib/images/smoothie_mango.png"],
    ["Banana", "30", Colors.yellow, "lib/images/smoothie_banana.png"],
    ["Verde Detox", "40", Colors.brown, "lib/images/smoothie_verde_detox.png"],
    ["Blueberry", "45", Colors.purple, "lib/images/smoothie_blueberry.png"],
    ["Sandía", "30", Colors.pink, "lib/images/smoothie_sandia.png"],
  ];

  final Function(String, double) addToCart;
  final Function(String, double) removeFromCart;
      
    SmoothieTab({
    super.key,
    required this.addToCart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: smoothiesOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.6),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                // Añadir al carrito al hacer tap
                String name = smoothiesOnSale[index][0];
                double price = double.parse(smoothiesOnSale[index][1]);
                addToCart(name, price);
              },
              child: SmoothieTile(
                smoothieFlavor: smoothiesOnSale[index][0],
                smoothiePrice: smoothiesOnSale[index][1],
                smoothieColor: smoothiesOnSale[index][2],
                imageName: smoothiesOnSale[index][3],
              ),
            ),
            // Botones para añadir y eliminar del carrito
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botón de eliminar
                GestureDetector(
                  onTap: () {
                    String name = smoothiesOnSale[index][0];
                    double price = double.parse(smoothiesOnSale[index][1]);
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
                    String name = smoothiesOnSale[index][0];
                    double price = double.parse(smoothiesOnSale[index][1]);
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