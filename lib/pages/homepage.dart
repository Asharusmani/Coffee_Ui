import 'package:coffeeshop_ui/util/coffee_tile.dart';
import 'package:coffeeshop_ui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _State();
}

class _State extends State<HomePage> {
  // List of coffee types
  final List<List<dynamic>> coffeeType = [
    ['Cappuccino', true],
    ['Latte', false],
    ['Black', false],
    ['Cold Coffee', false],
  ];

  // User tapped on coffee type
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          // Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "FIND THE BEST COFFEE FOR YOU",
              style: GoogleFonts.bebasNeue(
                fontSize: 40,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 25),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Find your coffee..",
                hintStyle: TextStyle(color: Colors.white38),
                prefixIcon: Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),

          // Horizontal ListView of coffee types
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTab: () => coffeeTypeSelected(index),
                );
              },
            ),
          ),
          SizedBox(height: 10), // Add some spacing

          // Horizontal ListView of coffee tiles
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CoffeeTile(
                    coffeeImagePath: 'https://images.pexels.com/photos/6612623/pexels-photo-6612623.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    coffeeName: 'Cold Coffee',
                    coffeePrice: '4.20',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'https://images.pexels.com/photos/2592761/pexels-photo-2592761.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    coffeeName: 'Cappuccino',
                    coffeePrice: '4.20',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'https://images.pexels.com/photos/350478/pexels-photo-350478.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    coffeeName: 'Latte',
                    coffeePrice: '4.20',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'https://images.pexels.com/photos/6205774/pexels-photo-6205774.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    coffeeName: 'Milk Coffee',
                    coffeePrice: '4.20',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
