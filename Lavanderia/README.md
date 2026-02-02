# Modelo de Banco de Dados – Lavanderia

Este repositório contém um **modelo relacional de banco de dados para uma lavanderia**, desenvolvido em **MySQL** utilizando o **MySQL Workbench (Forward Engineering)**.  
O modelo representa o funcionamento básico de uma lavanderia, incluindo clientes, máquinas de lavar, agendamentos e itens disponíveis para venda.

---

## Objetivo do Modelo

O objetivo deste esquema é modelar:
- O cadastro de clientes
- O controle de máquinas de lavar
- O gerenciamento de agendamentos
- O controle de itens e estoque da loja

O modelo foi estruturado para garantir **integridade referencial** e organização dos dados.

---

## Estrutura do Banco de Dados

### Cliente
Armazena os dados dos clientes da lavanderia.
- `cliente_nome`
- `cliente_cpf` (PK)
- `cliente_contato`

---

### Loja
Representa os itens disponíveis para venda na lavanderia.
- `nome_item` (PK)
- `estoque`
- `preço`

---

### Máquina de Lavar
Armazena informações sobre as máquinas disponíveis.
- `maquina_numero` (PK)
- `maquina_tipo`
- `maquina_capacidade`
- `maquina_disponibilidade`
- `maquina_preço`

---

### Agendamento
Registra os agendamentos realizados pelos clientes.
- `idagendamento`
- `agendamento_data`
- `agendamento_preço`
- `maquina_numero` (FK)
- `cliente_cpf` (FK)

Relacionamentos:
- Um cliente pode realizar vários agendamentos
- Uma máquina pode estar associada a vários agendamentos

---

## Relacionamentos Principais

- **Cliente → Agendamento** (1:N)
- **Máquina de Lavar → Agendamento** (1:N)

---

## Arquivos do Projeto

- `Codigo_Lavanderia.sql` → Script SQL de criação do banco
- `Esquema_Lavanderia.png` → Diagrama Entidade-Relacionamento (DER)

---

## Observações

- O modelo foi desenvolvido para fins **didáticos**
- Os preços são armazenados como `INT`
- O campo de disponibilidade da máquina indica se ela está disponível ou não para uso

---
