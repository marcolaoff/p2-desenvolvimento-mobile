import 'package:flutter/material.dart';
import '../cart.dart';

class BebidasPage extends StatelessWidget {
  // Lista de bebidas com nome, preço e descrição
  final List<Map<String, dynamic>> bebidas = [
    {'name': 'Coca Cola Lata', 'price': 6.0, 'description': 'Refrigerante clássico, 350ml.'},
    {'name': 'Coca Cola Lata Zero', 'price': 6.5, 'description': 'Refrigerante sem açúcar, 350ml.'},
    {'name': 'Fanta Laranja', 'price': 5.5, 'description': 'Refrigerante de laranja, 350ml.'},
    {'name': 'Fanta Uva', 'price': 5.5, 'description': 'Refrigerante de uva, 350ml.'},
    {'name': 'Skol', 'price': 8.0, 'description': 'Cerveja Skol, 350ml.'},
    {'name': 'Brahma', 'price': 8.5, 'description': 'Cerveja Brahma, 350ml.'},
    {'name': 'Antarctica', 'price': 7.5, 'description': 'Cerveja Antarctica, 350ml.'},
    {'name': 'Itaipava', 'price': 7.0, 'description': 'Cerveja Itaipava, 350ml.'},
    {'name': 'Outras Cervejas', 'price': 9.0, 'description': 'Outras marcas de cerveja, consulte.'},
    {'name': 'Heineken', 'price': 10.0, 'description': 'Cerveja Heineken, 330ml.'},
    {'name': 'Budweiser', 'price': 9.5, 'description': 'Cerveja Budweiser, 330ml.'},
    {'name': 'Suco de Laranja', 'price': 5.0, 'description': 'Suco de laranja natural, 300ml.'},
    {'name': 'Suco de Uva', 'price': 5.5, 'description': 'Suco de uva integral, 300ml.'},
    {'name': 'Suco de Maçã', 'price': 5.5, 'description': 'Suco de maçã natural, 300ml.'},
  ];

  final Function addToCart;

  BebidasPage({required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bebidas'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: bebidas.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      bebidas[index]['name'], // Nome da bebida
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      bebidas[index]['description'], // Descrição da bebida
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    trailing: Icon(Icons.add_shopping_cart),
                    onTap: () {
                      // Adicionar bebida ao carrinho
                      addToCart(CartItem(
                          name: bebidas[index]['name'],
                          price: bebidas[index]['price']
                      ));
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/carrinho');
                  },
                  child: Text('Ir para o Carrinho'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Voltar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}