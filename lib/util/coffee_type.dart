import 'package:flutter/material.dart';
class CoffeeType extends StatelessWidget {

final String coffeeType;
final bool isSelected;
final  VoidCallback onTab;
CoffeeType({
    required this.coffeeType,
  required this.isSelected,
  required this.onTab,
});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.only(left: 25,right: 10),
        child: Text(coffeeType,style: TextStyle(
            fontSize: 14,fontWeight: FontWeight.bold,
        color: isSelected ? Colors.orange: Colors.white38),),
      ),
    );
  }
}
