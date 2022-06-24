import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:productos/screens/screens.dart';
import 'package:productos/services/services.dart';
import 'package:productos/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);

    if ( productService.isLoading ) return const LoadingScreen();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemBuilder: ( BuildContext context, int index ) => GestureDetector(
          onTap: () {
            productService.selectedProduct = productService.productos[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(product: productService.productos[index],)
        ),
        itemCount: productService.productos.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () {},
      ),
    );
  }
}