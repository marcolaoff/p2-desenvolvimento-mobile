import 'package:flutter/material.dart';

class FinalizarPedidoPage extends StatefulWidget {
  final Function clearCart;  // Adicionamos o parâmetro para limpar o carrinho

  FinalizarPedidoPage({required this.clearCart});

  @override
  _FinalizarPedidoPageState createState() => _FinalizarPedidoPageState();
}

class _FinalizarPedidoPageState extends State<FinalizarPedidoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finalizar Pedido'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu telefone';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _enderecoController,
                decoration: InputDecoration(labelText: 'Endereço'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu endereço';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Limpa o carrinho antes de ir para a tela de agradecimento
                    widget.clearCart();

                    // Exibe a tela de agradecimento
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgradecimentoPage(),
                      ),
                    );
                  }
                },
                child: Text('Concluir Pedido'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AgradecimentoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Exibe uma tela de agradecimento por 3 segundos
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/');
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Obrigado pelo Pedido'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Seu pedido foi realizado com sucesso! \n\nObrigado!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.5,  // Ajusta o espaçamento entre as linhas
            ),
            textAlign: TextAlign.center,  // Centraliza o texto
          ),
        ),
      ),
    );
  }
}