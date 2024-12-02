import 'package:flutter/material.dart';
import '../cart.dart';

class BebidasPage extends StatelessWidget {
  // Lista de bebidas com nome, preço, descrição e imagem
  final List<Map<String, dynamic>> bebidas = [
    {
      'name': 'Coca Cola Lata',
      'price': 6.0,
      'description': 'Refrigerante clássico, 350ml.',
      'image': 'assets/images/coca_cola.jpg',
    },
    {
      'name': 'Coca Cola Lata Zero',
      'price': 6.5,
      'description': 'Refrigerante sem açúcar, 350ml.',
      'image': 'assets/images/coca_cola_zero.jpg',
    },
    {
      'name': 'Fanta Laranja',
      'price': 5.5,
      'description': 'Refrigerante de laranja, 350ml.',
      'image': 'assets/images/fanta_laranja.jpg',
    },
    {
      'name': 'Fanta Uva',
      'price': 5.5,
      'description': 'Refrigerante de uva, 350ml.',
      'image': 'assets/images/fanta_uva.jpg',
    },
    {
      'name': 'Skol',
      'price': 8.0,
      'description': 'Cerveja Skol, 350ml.',
      'image': 'assets/images/skol.jpg',
    },
    {
      'name': 'Brahma',
      'price': 8.5,
      'description': 'Cerveja Brahma, 350ml.',
      'image': 'assets/images/brahma.jpg',
    },
    {
      'name': 'Antarctica',
      'price': 7.5,
      'description': 'Cerveja Antarctica, 473ml.',
      'image': 'assets/images/antarctica.jpg',
    },
    {
      'name': 'Itaipava',
      'price': 7.0,
      'description': 'Cerveja Itaipava, 350ml.',
      'image': 'assets/images/itaipava.jpg',
    },
    {
      'name': 'Heineken',
      'price': 10.0,
      'description': 'Cerveja Heineken, 330ml.',
      'image': 'assets/images/heineken.jpg',
    },
    {
      'name': 'Budweiser',
      'price': 9.5,
      'description': 'Cerveja Budweiser, 330ml.',
      'image': 'assets/images/budweiser.jpg',
    },
    {
      'name': 'Suco de Laranja',
      'price': 5.0,
      'description': 'Suco de laranja natural, 300ml.',
      'image': 'assets/images/suco_laranja.jpg',
    },
    {
      'name': 'Suco de Uva',
      'price': 5.5,
      'description': 'Suco de uva integral, 300ml.',
      'image': 'assets/images/suco_uva.jpg',
    },
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
                    leading: Image.asset(
                      bebidas[index]['image'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      bebidas[index]['name'],
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bebidas[index]['description'],
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          'R\$ ${bebidas[index]['price'].toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.add_shopping_cart),
                    onTap: () {
                      // Adicionar bebida ao carrinho
                      addToCart(CartItem(
                          name: bebidas[index]['name'],
                          price: bebidas[index]['price']));
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