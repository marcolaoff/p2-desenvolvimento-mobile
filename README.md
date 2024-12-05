# p2-desenvolvimento-mobile
# Projeto: Tio do Sanduba  

## Descrição  
Este projeto é um aplicativo de pedidos para uma lanchonete fictícia chamada **Tio do Sanduba**. Ele permite que os clientes escolham combos, lanches e bebidas, adicionem itens ao carrinho e finalizem seus pedidos.  

O aplicativo foi desenvolvido com **Flutter**, seguindo boas práticas de organização de código e estrutura de pastas, além de utilizar recursos avançados como gerenciamento de estado e integração de pacotes externos do PubDev.  

---

## Funcionalidades  
- **Página Inicial**: Apresenta os combos disponíveis com um carrossel interativo.  
- **Página de Lanches**: Lista os lanches disponíveis com seus preços e descrições.  
- **Página de Bebidas**: Lista bebidas disponíveis.  
- **Carrinho de Compras**: Permite visualizar os itens adicionados e seus preços.  
- **Navegação**: Fácil transição entre as páginas por meio de botões intuitivos.  

---

## Requisitos Atendidos  

### 1. **Uso de StatefullWidget e `setState()`**  
- O componente de **carrinho** utiliza `StatefulWidget` para gerenciar os itens adicionados em tempo real.  
- O método `setState()` é usado para atualizar a interface sempre que um novo item é adicionado ao carrinho.  

### 2. **Organização do Projeto**  
O projeto foi estruturado de forma organizada para facilitar a manutenção e a escalabilidade:  
- **Pasta `widgets/`**: Contém componentes reutilizáveis como botões e listas.  
- **Pasta `pages/`**: Contém as páginas principais do aplicativo, como a HomePage, LanchesPage e BebidasPage.  
- **Pasta `models/`**: Define modelos de dados, como o modelo `CartItem` usado para representar itens do carrinho.  

### 3. **Uso de Pacote Externo**  
Foi utilizado o pacote **[carousel_slider](https://pub.dev/packages/carousel_slider)**, que permite implementar o carrossel da página inicial de forma simples e eficiente.  

---

## Tecnologias Utilizadas  
- **Flutter** (Dart)  
- **Pacotes Externos**:  
  - `carousel_slider`: Para o carrossel interativo na página inicial.  

---

## Instruções para Execução  

### Pré-requisitos  
1. Instale o Flutter: [Guia Oficial](https://flutter.dev/docs/get-started/install).  
2. Clone este repositório:  
   ```bash
   git clone https://github.com/seu-usuario/tio-do-sanduba.git](https://github.com/marcolaoff/p2-desenvolvimento-mobile.git)
3. Instale as dependências: flutter pub get

Equipe
Integrante 1
Integrante 2
Integrante 3
