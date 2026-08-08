# 🛒 More Devs E-commerce

Um projeto **contínuo e evolutivo de e-commerce desenvolvido em Flutter**, criado com o objetivo de colocar em prática e aprimorar conhecimentos no desenvolvimento de aplicações mobile.

A ideia do projeto é acompanhar a evolução do aprendizado em Flutter: novas funcionalidades, melhorias de arquitetura e novos conceitos serão incorporados conforme o conhecimento e a experiência com o framework forem aumentando.

## 📱 Sobre o projeto

O **More Devs E-commerce** começou como uma aplicação simples e está sendo desenvolvido gradualmente, permitindo experimentar diferentes conceitos e boas práticas do ecossistema Flutter.

Atualmente, o projeto conta com:

- 🔐 Página de login
- 📝 Página de cadastro
- 🧩 Componentização de widgets
- 🏗️ Separação entre camadas de **View** e **Controller**
- 🔄 Gerenciamento e controle de estados
- 📐 Organização e reutilização de componentes
- 📚 Aplicação prática de conceitos aprendidos durante os estudos

O projeto não possui como objetivo ser uma aplicação finalizada, mas sim servir como um **laboratório de aprendizado**, evoluindo constantemente junto com o conhecimento adquirido.

## 🚀 Tecnologias

- **Flutter**
- **Dart**

Novas tecnologias, bibliotecas e padrões poderão ser adicionados ao projeto conforme sua evolução.

## 🏗️ Arquitetura

A aplicação utiliza uma organização baseada em **features**, separando cada funcionalidade da aplicação em seu próprio módulo. Além disso, componentes e recursos compartilhados entre as funcionalidades ficam centralizados na camada `shared`.

A estrutura atual do projeto é:

```text
lib/
├── features/
│   ├── login/
│   │   ├── controllers/
│   │   └── pages/
│   │
│   └── signup/
│
└── shared/
    ├── widgets/
    ├── app_border.dart
    ├── app_colors.dart
    └── app_text_style.dart
```

### Features

Cada funcionalidade possui sua própria estrutura e responsabilidades. Atualmente, o projeto conta com as seguintes features:

- `login` — fluxo de autenticação e página de login
- `signup` — fluxo de cadastro de usuários

### Shared

A pasta `shared` concentra recursos reutilizáveis em diferentes partes da aplicação, evitando duplicação e facilitando a manutenção.

Atualmente, ela contém:

- **`widgets/`** — componentes reutilizáveis da interface
- **`app_border.dart`** — configurações e estilos de bordas
- **`app_colors.dart`** — definição das cores utilizadas na aplicação
- **`app_text_style.dart`** — estilos de texto utilizados na interface

Essa estrutura permite que o projeto cresça de forma organizada, mantendo cada funcionalidade isolada e facilitando a manutenção e evolução do código.

## 🎯 Objetivos

O principal objetivo do projeto é utilizar o desenvolvimento de um aplicativo real como forma de aprendizado prático.

Entre os objetivos estão:

- Aprimorar conhecimentos em Flutter e Dart
- Praticar gerenciamento de estados
- Desenvolver componentes reutilizáveis
- Melhorar a organização e arquitetura do código
- Aprender e aplicar boas práticas de desenvolvimento
- Experimentar novas ferramentas e bibliotecas
- Evoluir gradualmente a aplicação com novas funcionalidades

## 📚 Aprendizado contínuo

Este projeto representa uma jornada de aprendizado. Cada nova funcionalidade é uma oportunidade para estudar um conceito, testar uma abordagem diferente e melhorar a qualidade do código.

Por isso, o projeto estará em **constante evolução**, acompanhando o desenvolvimento das habilidades em Flutter.

---

### 👨‍💻 +DEVS2BLU

Projeto desenvolvido para estudos e evolução contínua no desenvolvimento com **Flutter**. Durante o curso do +DEVS2BLU.
