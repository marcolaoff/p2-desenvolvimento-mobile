import 'package:flutter/material.dart';
import '../cart.dart';

class LanchesPage extends StatelessWidget {
  // Lista de lanches com nome, preço, descrição e imagem
  final List<Map<String, dynamic>> lanches = [
    {
      'name': 'Hambúrguer de Carne',
      'price': 15.0,
      'description': 'Carne grelhada, queijo e molho especial.',
      'image': 'assets/images/hamburguer_carne.jpg',
    },
    {
      'name': 'Hambúrguer Vegetariano',
      'price': 17.0,
      'description': 'Feito com ingredientes vegetais e molho especial.',
      'image': 'assets/images/hamburguer_vegetariano.jpg',
    },
    {
      'name': 'Hot Dog',
      'price': 12.0,
      'description': 'Salsicha com molho e ketchup no pão fresquinho.',
      'image': 'assets/images/hot_dog.jpg',
    },
    {
      'name': 'Cheeseburger',
      'price': 18.0,
      'description': 'Carne com queijo cheddar derretido e molho.',
      'image': 'assets/images/cheeseburger.jpg',
    },
  ];

  final Function addToCart;

  LanchesPage({required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lanches'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: lanches.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          lanches[index]['image'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        Text(
                          lanches[index]['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          lanches[index]['description'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'R\$ ${lanches[index]['price'].toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            addToCart(CartItem(
                                name: lanches[index]['name'],
                                price: lanches[index]['price']));
                          },
                          child: Text('Adicionar ao Carrinho'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
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
                    backgroundColor: Colors.green,
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