import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lanchonete'),
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: [
          // Logo ajustado como fundo
          Center(
            child: Image.asset(
              'assets/images/logo_lanchonete.png',
              fit: BoxFit.contain, // Mantém proporções da imagem
              width: MediaQuery.of(context).size.width * 0.8, // 80% da largura da tela
            ),
          ),
          // Conteúdo principal (botões)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Botão para a página de lanches
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
                  // Botão para a página de bebidas
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
          ),
        ],
      ),
    );
  }
}