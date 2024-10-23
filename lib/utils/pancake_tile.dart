import 'package:flutter/material.dart';

class PanCakeTile extends StatelessWidget{
  final String pancakeFlavor;
  final String pancakePrice;
  final dynamic pancakeColor;
  final String imageName;

  const PanCakeTile(
    {super.key, 
    required this.pancakeFlavor, 
    required this.pancakePrice,  
    this.pancakeColor, 
    required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(color: pancakeColor[50], borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
          Container(
            decoration: BoxDecoration(
              color: pancakeColor[100], 
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                bottomLeft: Radius.circular(24)) ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
            child: Text("\$$pancakePrice",
            style: TextStyle(fontSize: 18, 
            fontWeight: FontWeight.bold,
            color: pancakeColor[800]
            ),),
            )],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Image.asset(imageName),  
            ),
            Text(pancakeFlavor,
              style:
                const TextStyle(fontSize: 16,
                fontWeight: FontWeight.bold),),
            Text("Añas",
            style: TextStyle(color: Colors.grey[600]),),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Icon(Icons.favorite, color: Colors.pink[400]),
                Icon(Icons.add, color: Colors.grey[00])
              ],),
            )
            ],
            ), 
      ),
    );
  }
}
