# Proposta

- API RESTful voltar para a terceira idade com registro de médicos, receitas, consultas e exames (pedidos e resultados), além de registros de saúde como pressão arterial, glicemia e oximetria.

## Funcionalidades

- Cadastro do usuário principal;
  - Nome
  - Nascimento
  - email
  - Tipo sanguíneo
  - Fator RH
  - Contato de emergência
- Consulta usuário;
- Atualizar dados de cadastro
- Deletar conta;
- Cadastro de usuários com acesso de leitura;
- Cadastro de médicos
  - Nome
  - Telefone
  - Especialidade
  - CRM
- Consulta perfil do médico
- Alterar perfil do médico
- Registro de consultas
  - Data
  - Médico
  - Receita - foto
  - Pedido de exames - foto
  - Observações
- Resultado de exames - foto, linkado a consulta

- Registro de pressão arterial, glicemia e oximetria (data, horário, valores, observações) (2ª fase)
  - Gerar relatório - por dia, semana, mês, ano;
- Registro de observações (salvar data + text com informações estado de saúde);
- Relatórios:
  - Consultas
  - Exames
  - Receitas
  - Consulta por médico
  - Exames por médico
  - Receitas por médico
  - Filtro de datas

## Desenvolvimento


### Hospedagem

-

### Back-end

- Node.js
- PostgreSQL
- NPM

- Bibliotecas:
  - express
  - nodemon
  - bcrypt
  - node-postgres
  - jsonwebtoken
  - multer
  - knex

### Front-end
- React.js