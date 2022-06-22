import 'package:flutter/material.dart';
import 'package:productos/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemBuilder: ( BuildContext context, int index ) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'product'),
          child: ProductCard()
        ),
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () {},
      ),
    );
  }
}