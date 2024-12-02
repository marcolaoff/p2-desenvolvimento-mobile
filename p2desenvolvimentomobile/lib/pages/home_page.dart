import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../cart.dart';

class HomePage extends StatelessWidget {
  final Function addToCart;

  HomePage({required this.addToCart});

  // Lista de combos disponíveis
  final List<Map<String, dynamic>> combos = [
    {
      'name': 'Combo 1: Hambúrguer + Coca Cola',
      'lanche': {'name': 'Hambúrguer de Carne', 'price': 15.0},
      'bebida': {'name': 'Coca Cola Lata', 'price': 6.0},
      'image': 'assets/images/combo1.png',
    },
    {
      'name': 'Combo 2: Cheeseburger + Fanta Laranja',
      'lanche': {'name': 'Cheeseburger', 'price': 18.0},
      'bebida': {'name': 'Fanta Laranja', 'price': 5.5},
      'image': 'assets/images/combo2.png',
    },
    {
      'name': 'Combo 3: Hot Dog + Suco de Laranja',
      'lanche': {'name': 'Hot Dog', 'price': 12.0},
      'bebida': {'name': 'Suco de Laranja', 'price': 5.0},
      'image': 'assets/images/combo3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tio do Sanduba'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.black, // Fundo da tela agora é preto
        child: Column(
          children: [
            // Logo no topo, mais próximo do início
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Image.asset(
                'assets/images/logo_lanchonete.png',
                width: MediaQuery.of(context).size.width * 1,
              ),
            ),
            SizedBox(height: 20),
            // Carrossel sem o logo
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    items: combos.map((combo) {
                      return GestureDetector(
                        onTap: () {
                          // Adiciona o combo ao carrinho e navega para o carrinho
                          addToCart(CartItem(
                            name: combo['lanche']['name'],
                            price: combo['lanche']['price'],
                          ));
                          addToCart(CartItem(
                            name: combo['bebida']['name'],
                            price: combo['bebida']['price'],
                          ));
                          Navigator.pushNamed(context, '/carrinho');
                        },
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.asset(
                              combo['image'],
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            Container(
                              color: Colors.black54,
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                combo['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Botões abaixo do carrossel
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/lanches');
                          },
                          child: Text('Ir para Lanches'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/bebidas');
                          },
                          child: Text('Ir para Bebidas'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}