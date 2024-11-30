import 'package:flutter/material.dart';
import '../cart.dart';

class LanchesPage extends StatelessWidget {
  // Lista de lanches com descrição e preço
  final List<Map<String, dynamic>> lanches = [
    {'name': 'Hambúrguer de Carne', 'price': 15.0, 'description': 'Carne grelhada, queijo e molho especial.'},
    {'name': 'Hambúrguer Vegetariano', 'price': 17.0, 'description': 'Feito com ingredientes vegetais e molho especial.'},
    {'name': 'Hot Dog', 'price': 12.0, 'description': 'Salsicha com molho e ketchup no pão fresquinho.'},
    {'name': 'Cheeseburger', 'price': 18.0, 'description': 'Carne com queijo cheddar derretido e molho.'},
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
                  child: ListTile(
                    title: Text(
                      lanches[index]['name'], // Nome do lanche
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      lanches[index]['description'], // Descrição do lanche
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    trailing: Icon(Icons.add_shopping_cart),
                    onTap: () {
                      // Adicionar o lanche ao carrinho
                      addToCart(CartItem(
                          name: lanches[index]['name'],
                          price: lanches[index]['price']
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