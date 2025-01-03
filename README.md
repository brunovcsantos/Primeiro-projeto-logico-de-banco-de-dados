# Primeiro-projeto-logico-de-banco-de-dados
Replicando a modelagem do projeto lógico de banco de dados para o cenário de e-commerce e aplicando junto os refinamentos propostos no módulo de modelagem conceitual.
<br>
Como demonstrado durante o desafio, realizei a criação do Script SQL para criação do esquema do banco de dados replicando os scripst da aula. Tambem apliquei no script
os refinamentos propostos no módulo de modelagem conceitual, refinamentos propóstos: 
-- Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
-- Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
-- Entrega – Possui status e código de rastreio;
<br>
Desse modo criei scripts para aplicar tais refinamentos surgindo novas tabelas:
-- physicalperson
-- legalperson
-- delivery
-- paymentforms
-- orderspaymentforms
<br>
Realize tambem a persistência de dados para realização de testes replicando as apresentadas durante a explicação do desafio, e criando novas inserção de dados e criação de 
queries SQL seguindo as seguintes cláusulas propostas no desafio:
-- Recuperações simples com SELECT Statement
-- Filtros com WHERE Statement
-- Crie expressões para gerar atributos derivados
-- Defina ordenações dos dados com ORDER BY
-- Condições de filtros aos grupos – HAVING Statement
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
<br>
E tambem criei queries para responder atraves delas as perguntas propostas pelo desafio:
-- Quantos pedidos foram feitos por cada cliente?
-- Algum vendedor também é fornecedor?
-- Relação de produtos fornecedores e estoques;
-- Relação de nomes dos fornecedores e nomes dos produtos;
<br>
Nos scripts adicionei comentarios para fazer a relação dos scripts e queries com as questões propostas pelo desafio.
