# Modelo de Banco de Dados Acadêmico

Este repositório contém um **modelo relacional de banco de dados acadêmico**, desenvolvido em **MySQL** utilizando o **MySQL Workbench (Forward Engineering)**.  
O modelo representa o funcionamento básico de uma instituição de ensino, incluindo alunos, cursos, turmas, matrículas e avaliações.

---

## Objetivo do Modelo

O objetivo deste esquema é modelar:
- O cadastro de alunos
- A oferta de cursos
- A organização de turmas
- O processo de matrícula
- O registro de avaliações e notas

O modelo segue princípios de **integridade referencial** e **normalização**, utilizando chaves primárias e estrangeiras.

---

##  Estrutura do Banco de Dados

### Aluno
Armazena informações dos alunos cadastrados.
- `idAluno` (PK)
- `Nome`
- `CPF` (único)
- `DataNascimento`

---

### Curso
Representa os cursos oferecidos pela instituição.
- `NomeCurso` (PK)
- `CargaHoraria`
- `Valor`
- `NotaMinima`

---

### Turma
Define as turmas vinculadas a um curso.
- `idTurma`
- `NomeTurma`
- `DataInicio`
- `NumVagas`
- `curso_NomeCurso` (FK)

Relacionamento:
- Cada turma pertence a **um curso**

---

### Matrícula
Relaciona alunos às turmas.
- `idMatricula`
- `DataMatricula`
- `Prestações`
- `Aluno_idAluno` (FK)
- `Turma_idTurma` (FK)

Relacionamentos:
- Um aluno pode ter várias matrículas
- Uma turma pode ter vários alunos matriculados

---

### Avaliação
Registra as avaliações associadas a uma matrícula.
- `idAvaliação`
- `Nota`
- `Data`
- `Matricula_idMatricula` (FK)

Relacionamento:
- Uma matrícula pode ter várias avaliações

---

## Relacionamentos Principais

- **Aluno → Matrícula** (1:N)
- **Curso → Turma** (1:N)
- **Turma → Matrícula** (1:N)
- **Matrícula → Avaliação** (1:N)

---

## Arquivos do Projeto

- `Codigo_Institucional.sql` → Script SQL de criação do banco
- `Esquema_Instituição.png` → Diagrama Entidade-Relacionamento (DER)

---

## Observações

- O modelo foi desenvolvido para fins **didáticos/acadêmicos**
- Algumas chaves primárias são compostas, conforme gerado pelo Workbench
- Os valores monetários são armazenados como `INT`

---
