import 'package:flutter/material.dart';
import 'package:p1_donut_app_samuel_gutierrez/utils/burger_tile.dart';

class BurgerTab extends StatelessWidget {
  final List burgersOnSale = [
    ["HamburguesaConChorizo", "60", Colors.blue, "lib/images/HamburguesaConChorizo.png"],
    ["HamburguesaConQueso", "30", Colors.red, "lib/images/HamburguesaConQueso.png"],
    ["HamburguesaConTocino", "40", Colors.purple, "lib/images/HamburguesaConTocino.png"],
    ["HamburguesaDePollo", "55", Colors.brown, "lib/images/HamburguesaDePollo.png"],
    ["HamburguesaDoble", "50", Colors.orange, "lib/images/HamburguesaDoble.png"],
    ["HamburguesaHawaiana", "45", Colors.green, "lib/images/HamburguesaHawaiana.png"],
    ["HamburguesaTriple", "70", Colors.pink, "lib/images/HamburguesaTriple.png"],
    ["HamburguesaVegetariana", "80", Colors.amber, "lib/images/HamburguesaVegetariana.png"],
  ];

  final Function(String, double) addToCart;
  final Function(String, double) removeFromCart;
      
    BurgerTab({
    super.key,
    required this.addToCart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: burgersOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.6),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                // Añadir al carrito al hacer tap
                String name = burgersOnSale[index][0];
                double price = double.parse(burgersOnSale[index][1]);
                addToCart(name, price);
              },
              child: BurgerTile(
                burgerFlavor: burgersOnSale[index][0],
                burgerPrice: burgersOnSale[index][1],
                burgerColor: burgersOnSale[index][2],
                imageName: burgersOnSale[index][3],
              ),
            ),
            // Botones para añadir y eliminar del carrito
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botón de eliminar
                GestureDetector(
                  onTap: () {
                    String name = burgersOnSale[index][0];
                    double price = double.parse(burgersOnSale[index][1]);
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
                    String name = burgersOnSale[index][0];
                    double price = double.parse(burgersOnSale[index][1]);
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