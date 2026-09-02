# 🛒 More Devs E-commerce

Aplicativo de e-commerce desenvolvido em **Flutter** e **Dart**, criado como projeto de estudo durante o curso **+DEVS2BLU**.

O projeto acompanha a evolução dos conhecimentos em desenvolvimento mobile, colocando em prática conceitos de arquitetura, gerenciamento de estado, componentização, navegação e organização de código.

> **Status:** em desenvolvimento. Atualmente, a aplicação utiliza **dados mockados localmente**, sem integração com API, banco de dados ou autenticação real de usuários.

## 📱 Sobre o projeto

O More Devs E-commerce começou como uma aplicação simples e vem evoluindo gradualmente para uma estrutura de e-commerce mais completa.

Atualmente, a aplicação possui:

* Login e cadastro de usuários *(apenas fluxo visual, sem autenticação real)*
* Recuperação de senha *(apenas fluxo visual)*
* Página inicial
* Exibição de produtos
* Categorias de produtos
* Listagem de produtos por categoria
* Carrosséis
* Componentização de widgets
* Gerenciamento de estado
* Sistema de rotas centralizado
* Tratamento de exceções
* Sistema de SnackBars customizado
* Skeleton loading
* Tema e estilos compartilhados
* Ícone personalizado do aplicativo
* Splash Screen personalizada

Os produtos, categorias, carrosséis e demais informações utilizadas pela aplicação são atualmente **mockados**. A integração com uma API e a implementação de autenticação e persistência de usuários fazem parte da evolução futura do projeto.

## 🛠️ Tecnologias e bibliotecas

### Base

* **Flutter**
* **Dart**

### Pacotes

* `provider` — gerenciamento de estado
* `carousel_slider` — carrosséis
* `smooth_page_indicator` — indicadores de páginas
* `skeletonizer` — estados de carregamento
* `animated_snack_bar` — feedback visual através de SnackBars
* `intl` — formatação e internacionalização

### Ferramentas de interface

* `flutter_launcher_icons` — geração do ícone do aplicativo
* `flutter_native_splash` — configuração da tela de abertura

## 🏗️ Arquitetura

O projeto utiliza uma organização baseada em **features**, mantendo cada funcionalidade agrupada em seu próprio módulo.

Recursos utilizados por diferentes partes da aplicação ficam centralizados em `shared`.

Estrutura atual:

```text
lib/
├── features/
│   ├── home/
│   │   ├── controllers/
│   │   ├── models/
│   │   ├── pages/
│   │   └── widgets/
│   │
│   ├── login/
│   │   ├── controllers/
│   │   ├── models/
│   │   └── pages/
│   │
│   ├── recover/
│   │   ├── controllers/
│   │   └── pages/
│   │
│   └── signup/
│       ├── controllers/
│       └── pages/
│
├── shared/
│   ├── exceptions/
│   ├── widgets/
│   ├── app_border.dart
│   ├── app_colors.dart
│   ├── app_snack_bar.dart
│   ├── app_text_style.dart
│   ├── enums.dart
│   ├── mocks.dart
│   └── utils.dart
│
├── main.dart
└── routes.dart
```

### Features

#### `home`

Responsável pela área principal do e-commerce, incluindo produtos, categorias, carrosséis e listagem de produtos por categoria.

#### `login`

Responsável pelo fluxo de login e sua interface.

#### `signup`

Responsável pelo fluxo de cadastro de usuários.

#### `recover`

Responsável pelo fluxo de recuperação de acesso.

### `shared`

Concentra elementos reutilizáveis entre diferentes funcionalidades, como widgets, exceções, estilos, cores, enums, mocks e funções utilitárias.

## 🧭 Navegação

As rotas da aplicação são centralizadas em `routes.dart`, organizando a navegação entre as principais funcionalidades:

* Login
* Cadastro
* Recuperação de senha
* Home
* Produtos por categoria

## 🎯 Objetivos do projeto

O principal objetivo é utilizar o desenvolvimento de uma aplicação real como ferramenta de aprendizado.

Entre os objetivos:

* Aprimorar conhecimentos em Flutter e Dart
* Praticar gerenciamento de estado
* Aplicar arquitetura baseada em features
* Desenvolver componentes reutilizáveis
* Trabalhar com navegação entre telas
* Praticar separação de responsabilidades
* Implementar tratamento de erros e exceções
* Trabalhar com estados de carregamento
* Experimentar diferentes bibliotecas do ecossistema Flutter
* Evoluir gradualmente a aplicação
* Futuramente integrar uma API e substituir os dados mockados por dados reais

## 📚 Aprendizado contínuo

O projeto está em constante evolução.

Novas funcionalidades, melhorias de arquitetura e novas tecnologias serão incorporadas conforme novos conceitos forem estudados.

A ideia é que o código acompanhe essa evolução, servindo não apenas como uma aplicação de e-commerce, mas também como um registro prático do aprendizado em Flutter.

## 👨‍💻 +DEVS2BLU

Projeto desenvolvido para estudos e evolução contínua no desenvolvimento com Flutter durante o curso **+DEVS2BLU**.
