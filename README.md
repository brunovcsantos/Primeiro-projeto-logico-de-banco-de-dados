# Primeiro-projeto-logico-de-banco-de-dados
Replicando a modelagem do projeto lógico de banco de dados para o cenário de e-commerce e aplicando junto os refinamentos propostos no módulo de modelagem conceitual. <br>
<br>
Como demonstrado durante o desafio, realizei a criação do Script SQL para criação do esquema do banco de dados replicando os scripst da aula. Tambem apliquei no script
os refinamentos propostos no módulo de modelagem conceitual, refinamentos propóstos: <br>
-- Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;<br>
-- Pagamento – Pode ter cadastrado mais de uma forma de pagamento;<br>
-- Entrega – Possui status e código de rastreio;<br>
<br>
Desse modo criei scripts para aplicar tais refinamentos surgindo novas tabelas:<br>
-- physicalperson <br>
-- legalperson <br>
-- delivery <br>
-- paymentforms <br>
-- orderspaymentforms <br>
<br>
Realize tambem a persistência de dados para realização de testes replicando as apresentadas durante a explicação do desafio, e criando novas inserção de dados e criação de 
queries SQL seguindo as seguintes cláusulas propostas no desafio: <br>
-- Recuperações simples com SELECT Statement <br>
-- Filtros com WHERE Statement <br>
-- Crie expressões para gerar atributos derivados <br>
-- Defina ordenações dos dados com ORDER BY <br>
-- Condições de filtros aos grupos – HAVING Statement <br>
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados <br>
<br>
E tambem criei queries para responder atraves delas as perguntas propostas pelo desafio:<br>
-- Quantos pedidos foram feitos por cada cliente?<br>
-- Algum vendedor também é fornecedor? <br>
-- Relação de produtos fornecedores e estoques; <br>
-- Relação de nomes dos fornecedores e nomes dos produtos; <br>
<br>
Nos scripts adicionei comentarios para fazer a relação dos scripts e queries com as questões propostas pelo desafio.
