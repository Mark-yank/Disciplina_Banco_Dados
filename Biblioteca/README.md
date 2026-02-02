# Modelo de Banco de Dados – Biblioteca

Este repositório contém um **modelo relacional de banco de dados para uma biblioteca**, desenvolvido em **MySQL** utilizando o **MySQL Workbench (Forward Engineering)**.  
O modelo representa o gerenciamento de clientes, livros, coleções e empréstimos, incluindo o controle de multas.

---

## Objetivo do Modelo

O objetivo deste esquema é modelar:
- O cadastro de clientes
- O controle do acervo de livros
- A organização de coleções
- O registro de empréstimos
- O cálculo de multas por atraso

O modelo foi estruturado para garantir **integridade referencial** e organização dos dados.

---

## Estrutura do Banco de Dados

### Cliente
Armazena os dados dos clientes da biblioteca.
- `idCliente` (PK)
- `NomeCliente`
- `Contato`

---

### Coleção
Representa agrupamentos de livros no acervo.
- `idColeção` (PK)
- `Nome`
- `QtdLivros`

---

### Livros
Armazena informações dos livros disponíveis.
- `idLivro`
- `NomeLivro`
- `Genero`
- `Editora`
- `NumPaginas`
- `ValorDiarioMulta`
- `Estoque`
- `Coleção_idColeção` (FK)

Relacionamento:
- Um livro pode pertencer a uma coleção

---

### Empréstimos
Registra os empréstimos realizados pelos clientes.
- `idEmprestimos`
- `Livro`
- `DataEmprestimo`
- `PrazoDevolução`
- `ValorTotalMulta`
- `Cliente_idCliente` (FK)

Relacionamento:
- Um cliente pode realizar vários empréstimos

---

### Livros Foi Emprestado
Tabela associativa entre livros e empréstimos.
- `Livros_idLivro` (FK)
- `Emprestimos_idEmprestimos` (FK)

Relacionamento:
- Um empréstimo pode conter um ou mais livros
- Um livro pode participar de vários empréstimos

---

## Relacionamentos Principais

- **Cliente → Empréstimos** (1:N)
- **Coleção → Livros** (1:N)
- **Livros ↔ Empréstimos** (N:N)

---

## Arquivos do Projeto

- `Codigo_Biblioteca.sql` → Script SQL de criação do banco
- `Esquema_Biblioteca.png` → Diagrama Entidade-Relacionamento (DER)

---

## Observações

- O modelo foi desenvolvido para fins **didáticos**
- O valor da multa é calculado com base no valor diário e no prazo de devolução
- Algumas tabelas utilizam chaves primárias compostas, conforme gerado pelo Workbench

---
