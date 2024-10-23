import 'package:flutter/material.dart';
import 'package:p1_donut_app_samuel_gutierrez/utils/pizza_tile.dart';

class PizzaTab  extends StatelessWidget {
  // list of donuts
  final List pizzasOnSale = const [
    // [ pizzaFlavor, pizzaPrice, pizzaColor, imageName ]
    ["Mushroom", "150", Colors.blue, "lib/images/PizzaChampiñon.png"],
    ["Hawaiian", "130", Colors.red, "lib/images/PizzaHawaiana.png"],
    ["Italian", "160", Colors.purple, "lib/images/PizzaItaliana.png"],
    ["Mexican", "190", Colors.brown, "lib/images/PizzaMexicana.png"],
    ["Pastor", "190", Colors.green, "lib/images/PizzaPastor.png"],
    ["Pepperoni", "120", Colors.yellow, "lib/images/PizzaPeperoni.png"],
    ["Salami", "130", Colors.orange, "lib/images/PizzaSalami.png"],
    ["Vegetarian", "250", Colors.pink, "lib/images/PizzaVegetariana.png"],
  ];

  final Function(String, double) addToCart;
  final Function(String, double) removeFromCart;
    
    const PizzaTab({
    super.key,
    required this.addToCart,
    required this.removeFromCart,
  });

@override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pizzasOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.6),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                // Añadir al carrito al hacer tap
                String name = pizzasOnSale[index][0];
                double price = double.parse(pizzasOnSale[index][1]);
                addToCart(name, price);
              },
              child: PizzaTile(
                pizzaFlavor: pizzasOnSale[index][0],
                pizzaPrice: pizzasOnSale[index][1],
                pizzaColor: pizzasOnSale[index][2],
                imageName: pizzasOnSale[index][3],
              ),
            ),
            // Botones para añadir y eliminar del carrito
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botón de eliminar
                GestureDetector(
                  onTap: () {
                    String name = pizzasOnSale[index][0];
                    double price = double.parse(pizzasOnSale[index][1]);
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
                    String name = pizzasOnSale[index][0];
                    double price = double.parse(pizzasOnSale[index][1]);
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