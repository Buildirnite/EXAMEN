import 'package:flutter/material.dart';
import 'package:proyecto_examen/models/productos.dart';
import 'package:proyecto_examen/screen/screen.dart';
import 'package:proyecto_examen/services/product_service.dart';
import 'package:proyecto_examen/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({super.key});
  @override
  _ListProductScreenState createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    if (productService.isLoading) return const LoadingScreen();
    //filtro de los productos según búsqueda
    final filteredProducts = productService.products.where((product) {
      return product.productName.toLowerCase().contains(search.toLowerCase());
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de productos'),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar productos .....',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    search = value; //actualizar
                  });
                },
              ),
            )),
      ),
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            productService.SelectProduct = filteredProducts[index].copy();
            Navigator.pushNamed(context, 'edit');
          },
          child: ProductCard(product: filteredProducts[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productService.SelectProduct = Listado(
            productId: 0,
            productName: '',
            productPrice: 0,
            productImage:
                'https://as2.ftcdn.net/v2/jpg/02/51/95/53/1000_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
            productState: '',
          );
          Navigator.popAndPushNamed(context, 'edit');
        },
      ),
    );
  }
}
