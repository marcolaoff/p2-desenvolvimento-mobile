import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../cart.dart';

class HomePage extends StatelessWidget {
  final Function addToCart;

  HomePage({required this.addToCart});

  // Lista de combos disponíveis
  final List<Map<String, dynamic>> combos = [
    {
      'name': 'Combo 1: X-Salada + Coca Cola',
      'items': [
        {'name': 'X-Salada', 'price': 20.0},
        {'name': 'Coca Cola Lata', 'price': 2.99},
      ],
      'totalPrice': 22.99,
      'image': 'assets/images/combo1.png',
    },
    {
      'name': 'Combo 2: Hot Dog + Coca Cola',
      'items': [
        {'name': 'Hot Dog', 'price': 12.0},
        {'name': 'Coca Cola Lata', 'price': 4.99},
      ],
      'totalPrice': 16.99,
      'image': 'assets/images/combo2.png',
    },
    {
      'name': 'Combo 3: 2 X-Salada + X-Tudo',
      'items': [
        {'name': 'X-Salada', 'price': 20.0},
        {'name': 'X-Salada', 'price': 20.0},
        {'name': 'X-Tudo', 'price': 33.0},
      ],
      'totalPrice': 70.0,
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
            // Logo no topo
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Image.asset(
                'assets/images/logo_lanchonete.png',
                width: MediaQuery.of(context).size.width * 1,
              ),
            ),
            SizedBox(height: 20),
            // Carrossel com os combos atualizados
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    items: combos.map((combo) {
                      return GestureDetector(
                        onTap: () {
                          // Adiciona os itens do combo ao carrinho
                          for (var item in combo['items']) {
                            addToCart(CartItem(
                              name: item['name'],
                              price: item['price'],
                            ));
                          }
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
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    combo['name'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'R\$ ${combo['totalPrice'].toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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