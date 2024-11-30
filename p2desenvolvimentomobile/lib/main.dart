import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/lanches_page.dart';
import 'pages/bebidas_page.dart';
import 'pages/carrinho_page.dart';
import 'pages/finalizar_pedido_page.dart';
import 'cart.dart';  // O modelo de item de carrinho

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<CartItem> cartItems = [];

  // Função para adicionar itens ao carrinho
  void addToCart(CartItem item) {
    setState(() {
      cartItems.add(item);
    });
  }

  // Função para remover itens do carrinho
  void removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  // Função para limpar o carrinho
  void clearCart() {
    setState(() {
      cartItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lanchonete App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/lanches': (context) => LanchesPage(addToCart: addToCart),
        '/bebidas': (context) => BebidasPage(addToCart: addToCart),
        '/carrinho': (context) => CarrinhoPage(cartItems: cartItems, removeFromCart: removeFromCart),
        '/finalizar': (context) => FinalizarPedidoPage(clearCart: clearCart),
      },
    );
  }
}