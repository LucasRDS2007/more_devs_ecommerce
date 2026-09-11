# 📋 Homologação em Par — Teste Cruzado (Flutter)

**Projeto avaliado:** more_devs_ecommerce — github.com/LucasRDS2007/more_devs_ecommerce
**Dupla autora:** Samuel e Lucas
**Dupla avaliadora:** Samuel e Lucas
**Data:** 10/09/2026

> Rode o projeto da outra dupla e anote abaixo os **bugs** que encontrar durante o uso e as **práticas ruins** que notar no código.

---

## 🐞 Bugs encontrados

_(o que quebra ou não funciona ao usar o app — descreva o problema e, se possível, como reproduzir)_

### 1. Lista de requisitos de senha sempre com ícone de "check"

![alt text](bug1-senha-requisitos.png)
![alt text](image.png)

Na tela de **Cadastro**, todos os itens da lista de requisitos usam sempre o mesmo ícone `Icons.check_circle`. Um requisito **não atendido** continua mostrando um ✓ (só muda a cor para cinza), passando a impressão de que já foi cumprido — deveria ser um círculo vazio / "X". Além disso os rótulos têm erros de português: "maiscula", "minuscula", "caracter" (→ maiúscula, minúscula, caractere).
_Reproduzir:_ abrir Cadastro e digitar uma senha fraca (ex.: `abc`) — os itens seguem com o ✓.

### 2. Overflow nos cards de produto

![alt text](bug2-bottomoverflow.png)

Os cards estouram o layout ("BOTTOM OVERFLOWED BY 15 PIXELS"). O `ProductCard` é uma `Column` com imagem de altura fixa (160) + 3 textos, colocada em contêineres de altura fixa (`mainAxisExtent: 265` na grade, `SizedBox` de 30% da tela na home) que não comportam o conteúdo. Não há `Flexible`/`FittedBox` nem `maxLines`/`overflow` nos textos.
_Reproduzir:_ abrir a Home ou "Produtos por categoria" e observar o rodapé dos cards.

### 3. Erro de digitação no filtro de marcas

![alt text](erro-digitacao1.png)

O item padrão do dropdown de marcas está escrito **"Toda as Marcas"** — o correto é **"Todas as Marcas"** (`lib/shared/widgets/app_dropdown_button_form_field.dart:38`).

---

## 🔎 `flutter analyze` — 2 avisos

![alt text](flutteranalyze-errors.png)

- **`use_build_context_synchronously`** (`signup_page.dart:139`) — o `BuildContext` é usado para exibir o `SnackBar` **depois de um `await`** sem checar `context.mounted`. Se o usuário sair da tela durante o cadastro, pode gerar exceção.
- **`strict_top_level_inference`** (`modals.dart:4`) — o parâmetro `context` do método `appBottomSheet` está **sem tipo declarado**; deveria ser `BuildContext context`.

---

## ⚠️ Práticas ruins de codificação

_(o que está mal feito no código)_

- **`Product.fromJson` grava valor errado:** `category: 'category'` (string literal) — todo produto fica com a categoria `"category"` em vez do valor do JSON. Sem cast/validação de tipos (`json['price']`, `json['name']`) e sem null-safety.
- **Erros de digitação em nomes públicos:** classe `Untils` (→ `Utils`), método `hadleSignup` (→ `handleSignup`), enum `sucess` (→ `success`), `AppTextStyle.tittle` / `subTittle` (→ `title`). Typos em identificadores atrapalham busca e autocomplete.
- **Idioma misturado (PT + EN) sem padrão:** `getProductsByCategory`, `selectedBrand`, `changeActiveCheckbox` convivem com `senha`, `nomeController`, `validateNome`. Definir um idioma só.
- **`try/catch` que engole exceções:** vários controllers fazem `catch (e) { changeState(error) }` sem log (`getProducts`, `getCategories`, `getProductsByCategory`, `getFilteredProducts`). Erros reais desaparecem. Em alguns casos o bloco `try` nem pode lançar (só um `.map` sobre lista mock) — try/catch inútil.
- **Validadores ignoram o parâmetro `value`:** `validateEmail(String? value)` / `validateSenha(value)` descartam o argumento e leem `emailController.text` / `senha` direto do estado. Frágil e confuso.
- **`hadleSignup` roda `signup()` mesmo com formulário inválido** (o `await signup()` está fora do `if (validate())`) e faz `isLoading = false` **depois** do último `notifyListeners()`, então a UI não atualiza. Não há navegação nem feedback de sucesso no cadastro.
- **Acesso a `user!` sem checagem:** `HomePage` usa `loginController.user!.name`. Abrir a Home sem login (ou após logout) causa crash de null. Não há proteção de rotas.
- **Arquitetura de estado inconsistente:** quase tudo é `ChangeNotifier` + `Provider`, mas `RecoverController` é classe comum instanciada dentro do `State` e recriada a cada `build`; `changeActiveButton` não chama `notifyListeners`. `CartController` está **vazio** e a `CartPage` mostra valores fixos ("RS 99,50" — ainda com "RS" em vez de "R$").
- **Trabalho repetido no `build`:** `ProductCard.build` cria `Modals()` e `Untils()` a cada rebuild; `HomeProductsSection._getProductsList()` é chamado 2x por item (no `itemCount` e no `itemBuilder`), refazendo a lista a cada frame.
- **Código morto / comentado:** blocos comentados em `home_page.dart` (botão de debug) e `cart_page.dart` (`// ListView()`), import comentado, `lib/shared/enums.dart` é um arquivo **vazio**, comentário solto `//as` no `main.dart`.
- **Padrão frágil de "ocupar a tela inteira":** `SizedBox(height: screenHeight - padding.top - padding.bottom)` dentro de `SingleChildScrollView` repetido em Login, Cadastro e Recuperar — quebra em telas pequenas / com teclado aberto.
- **Credenciais hardcoded:** `LoginController.login()` compara com `'Lucas@gmail.com'` / `'010203'` em texto puro no código.
- **Números mágicos e sem tema de espaçamento:** `EdgeInsets.fromLTRB(20, 20, 20, 0)`, `height: 160`, `mainAxisExtent: 265`, `Duration(seconds: 3)` repetido. Existe `AppColors`/`AppTextStyle`, mas nada como `AppSpacing`.
- **Tipos de callback fracos:** `final Function(String?) onChanged` em vez de `ValueChanged<String?>` / `void Function(String?)`.
- **Sem testes:** não há pasta `test/`; o `widget_test.dart` padrão foi removido e nada substituiu.
