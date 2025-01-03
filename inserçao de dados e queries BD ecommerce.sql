							-- inserção de dados e queries
use ecommerce;

show tables;
 -------------------------------------------------------------------------------------------------------------------
                                   -- INSERÇÃO DE DADOS
 -------------------------------------------------------------------------------------------------------------------
--  Tabela clients
INSERT INTO clients (Fname, Minit, Lname, Email, Cellphone, HomePhone, Address)
		VALUES  ('João', 'A.', 'Silva', 'joao.silva@email.com', '11987654321', '1134567890', 'Rua das Flores, 123, São Paulo'),
				('Maria', 'B.', 'Oliveira', 'maria.oliveira@email.com', '21987654321', NULL, 'Avenida Central, 456, Rio de Janeiro'),
				('Carlos', 'C.', 'Santos', 'carlos.santos@email.com', '31987654321', '3134567890', 'Praça da Liberdade, 789, Belo Horizonte'),
				('Ana', 'D.', 'Costa', 'ana.costa@email.com', '41987654321', NULL, 'Rua Paraná, 101, Curitiba'),
				('Paulo', 'E.', 'Lima', 'paulo.lima@email.com', '51987654321', '5134567890', 'Rua Porto Alegre, 202, Porto Alegre'),
				('Fernanda', 'F.', 'Souza', 'fernanda.souza@email.com', '61987654321', NULL, 'Rua Brasília, 303, Brasília');

select * from clients;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela physicalPerson
INSERT INTO physicalPerson (idClient, CPF, RG, DateNasc)
		VALUES  (1, '12345678901', 'MG1234567', '1980-05-10'),
				(2, '23456789012', 'SP2345678', '1990-07-15'),
				(4, '45678901234', 'PR4567890', '2000-12-25');

select * from physicalPerson;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela LegalPerson
INSERT INTO LegalPerson (idClient, CNPJ, socialName, StateRegistration)
		VALUES  (3, '34567890100145', 'Empresa C SA', 'MG3456789'),
				(5, '56789012300167', 'Empresa E MEI', 'RS5678901'),
				(6, '67890123400178', 'Empresa F LTDA', 'DF6789012');

select * from LegalPerson;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela product
INSERT INTO product (Pname, Classification_kids, Category, ProductDescription, SellingPrice, CostPrice, Evaluation, Size)
		VALUES  ('Smartphone', false, 'Eletrônico', 'Celular Android com 128GB', 1500.00, 1000.00, 4.5, '14x7cm'),
				('Camiseta', false, 'Vestimentas', 'Camiseta básica 100% algodão', 50.00, 30.00, 4.7, 'M'),
				('Boneca', true, 'Brinquedos', 'Boneca com roupas intercambiáveis', 120.00, 80.00, 4.8, '30cm'),
				('Cadeira', false, 'Móveis', 'Cadeira de escritório ergonômica', 350.00, 200.00, 4.6, '50x50x70cm'),
				('Notebook', false, 'Eletrônico', 'Notebook com 8GB RAM e SSD 256GB', 4000.00, 3000.00, 4.9, '30x20cm'),
				('Biscoito', false, 'Alimentos', 'Pacote de biscoito recheado 200g', 5.00, 2.50, 4.2, '200g');

select * from product;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela orders
INSERT INTO orders (idOrderClient, orderDate, orderStatus, orderDescription, freight)
		VALUES  (1, '2025-01-01 10:00:00', 'Confirmado', 'Compra de produtos eletrônicos', 20.00),
				(2, '2025-01-02 12:00:00', 'Em Processamento', 'Compra de roupas e brinquedos', 15.00),
				(3, '2025-01-03 14:00:00', 'Confirmado', 'Compra de móveis', 30.00),
				(4, '2025-01-04 16:00:00', 'Cancelado', 'Compra de alimentos e brinquedos', 10.00),
				(4, '2025-01-05 18:00:00', 'Confirmado', 'Compra de eletrônicos e roupas', 25.00),
				(1, '2025-01-06 20:00:00', 'Em Processamento', 'Compra de diversos produtos', 35.00);

select * from orders;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela delivery
INSERT INTO delivery (idOrder, departureDate, expectedDeliveryDate, actualDeliveryDate, deliveryCost, carrier, deliveryStatus, address)
		VALUES  (1, '2025-01-02 08:00:00', '2025-01-05', '2025-01-04', 20.00, 'Correios', 'Entregue', 'Rua das Flores, 123, São Paulo'),
				(2, '2025-01-03 09:00:00', '2025-01-07', NULL, 15.00, 'FedEx', 'Em Transporte', 'Avenida Central, 456, Rio de Janeiro'),
				(3, '2025-01-04 10:00:00', '2025-01-10', NULL, 30.00, 'DHL', 'Pendente', 'Praça da Liberdade, 789, Belo Horizonte'),
				(4, '2025-01-05 11:00:00', '2025-01-09', NULL, 10.00, 'JadLog', 'Cancelada', 'Rua Paraná, 101, Curitiba'),
				(5, '2025-01-06 12:00:00', '2025-01-12', NULL, 25.00, 'Correios', 'Pendente', 'Rua Porto Alegre, 202, Porto Alegre'),
				(6, '2025-01-07 13:00:00', '2025-01-15', NULL, 35.00, 'Transportadora Local', 'Em Transporte', 'Rua Brasília, 303, Brasília');
 
 select * from delivery;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela paymentForms
INSERT INTO paymentForms (paymentType, paymentFormName, cardNumber, cardName, cardValidity, CVV, pixKey, billCode, bankTransfer, agencyTransfer, accountTransfer, installmentsAllowed, installmentInterestRate, dueDate, observations, asset)
		VALUES  ('Cartão de Crédito', 'Visa Gold', '4111111111111111', 'João Silva', '2025-12-31', '123', NULL, NULL, NULL, NULL, NULL, 12, 2.99, NULL, 'Pagamento para eletrônicos', true),
				('Cartão de Débito', 'MasterCard Débito', '5555555555554444', 'Maria Oliveira', '2026-06-30', '456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pagamento à vista', true),
				('Pix', NULL, NULL, NULL, NULL, NULL, 'joao.silva@email.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Chave PIX do João Silva', true),
				('Boleto', NULL, NULL, NULL, NULL, NULL, NULL, '12345678901234567890123456789012345678901234', NULL, NULL, NULL, NULL, NULL, '2025-01-15', 'Boleto gerado pela plataforma', true),
				('Transferência Bancária', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Banco do Brasil', '1234', '56789-0', NULL, NULL, NULL, 'Transferência via Banco do Brasil', true),
				('Cartão de Crédito', 'Elo Básico', '6221261111111111', 'Carlos Santos', '2024-11-30', '789', NULL, NULL, NULL, NULL, NULL, 6, 1.99, NULL, 'Compra de móveis', true);

 select * from paymentForms;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela productStorage
INSERT INTO productStorage (storageLocation, quantity, maxCapacity, UpdateDate)
		VALUES  ('São Paulo - Centro', 100, 200, '2025-01-01 08:00:00'),
				('Rio de Janeiro - Zona Norte', 50, 150, '2025-01-01 09:00:00'),
				('Belo Horizonte - Pampulha', 75, 120, '2025-01-01 10:00:00'),
				('Curitiba - Centro', 90, 100, '2025-01-01 11:00:00'),
				('Porto Alegre - Zona Sul', 60, 80, '2025-01-01 12:00:00'),
				('Brasília - Asa Sul', 30, 50, '2025-01-01 13:00:00');

select * from productStorage;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela supplier
INSERT INTO supplier (socialName, CNPJ, contact, Email, address)
		VALUES  ('Fornecedor A', '12345678000123', '11987654321', 'fornecedorA@email.com', 'Rua A, 123, São Paulo'),
				('Fornecedor B', '23456789000134', '21987654321', 'fornecedorB@email.com', 'Avenida B, 456, Rio de Janeiro'),
				('Fornecedor C', '34567890100145', '31987654321', 'fornecedorC@email.com', 'Praça C, 789, Belo Horizonte'),
				('Fornecedor D', '45678901200156', '41987654321', 'fornecedorD@email.com', 'Rua D, 101, Curitiba'),
				('Fornecedor E', '56789012300167', '51987654321', 'fornecedorE@email.com', 'Rua E, 202, Porto Alegre'),
				('Fornecedor F', '67890123400178', '61987654321', 'fornecedorF@email.com', 'Rua F, 303, Brasília');

select * from supplier;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela seller
INSERT INTO seller (socialName, abstName, CNPJ, CPF, location, contact) 
		VALUES('Vendedor Comércio LTDA', 'Comércio SP', '12345678000123', null, 'São Paulo, SP', '11987654321'),
			  ('Luis', null, null, '987654321', 'Rio de Janeiro, RJ', '21987654321'),
			  ('Francisca', null, null, '654321987', 'Belo Horizonte, MG', '31987654321'),
			  ('Super Vendas', 'Super Store', '78901234000166', null, 'Curitiba, PR', '61987654321');

select * from seller;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela productSeller
INSERT INTO productSeller (idPseller, idPproduct, prodQuantity) 
		VALUES(1, 1, 10),
			  (2, 2, 20),
			  (3, 3, 15),
			  (4, 4, 5);

select * from productSeller;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela productOrder
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) 
		VALUES(1, 1, 2, 'Disponivel'),
			  (2, 2, 1, 'Disponivel'),
			  (3, 3, 3, 'Sem Estoque'),
			  (4, 4, 4, 'Disponivel'),
              (5, 5, 3, 'Disponivel'),
			  (6, 6, 1, 'Sem Estoque');

select * from productOrder;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela ordersPaymentForms
INSERT INTO ordersPaymentForms (idOPForder, idOPFpaymentForms, ValuePaid, Installments, DatePayment, StatusPayment, ProofPayment)
		VALUES  (1, 1, 1500.00, 12, '2025-01-02 10:00:00', 'Concluído', 'Comprovante_001.pdf'),
				(2, 2, 50.00, 1, '2025-01-03 12:00:00', 'Concluído', 'Comprovante_002.pdf'),
				(3, 3, 120.00, 1, '2025-01-04 14:00:00', 'Pendente', NULL),
				(4, 4, 350.00, 1, '2025-01-05 16:00:00', 'Cancelado', NULL),
				(5, 5, 4000.00, 6, '2025-01-06 18:00:00', 'Concluído', 'Comprovante_005.pdf'),
				(6, 6, 5.00, 1, '2025-01-07 20:00:00', 'Concluído', 'Comprovante_006.pdf');

select * from ordersPaymentForms;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela storageLocation
INSERT INTO storageLocation (idSLproduct, idSLstorage, Location)
		VALUES  (1, 1, 'São Paulo - Centro'),
				(2, 2, 'Rio de Janeiro - Zona Norte'),
				(3, 3, 'Belo Horizonte - Pampulha'),
				(4, 4, 'Curitiba - Centro'),
				(5, 5, 'Porto Alegre - Zona Sul'),
				(6, 6, 'Brasília - Asa Sul');

select * from storageLocation;
 -------------------------------------------------------------------------------------------------------------------
-- Tabela productSupplier
INSERT INTO productSupplier (idPsSupplier, idPsProduct, psQuantity)
		VALUES  (1, 1, 50),
				(2, 2, 100),
				(3, 3, 75),
				(4, 4, 20),
				(5, 5, 60),
				(6, 6, 30);

select * from productSupplier;

  -------------------------------------------------------------------------------------------------------------------                                                                  
                                  -- MAIS QUERIES
---------------------------------------------------------------------------------------------------------------------

-- quantidade de clientes existentes
select count(*) from clients; 

-- pedidos feito por clientes
select * from clients c, orders o where c.idClient = o.idOrderClient; 
select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = o.idOrderClient;
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = o.idOrderClient;

-- quantos pedidos existentes?
select count(*) from clients c, orders o 
			where c.idClient = idOrderClient; 

-- recuperação de pedido com produto associado
select * from clients c 
			inner join orders o on c.idClient = o.idOrderClient
			inner join productOrder p on p.idPOorder = o.idOrder;
                
-- Recuperar quantos pedidos foram feitos por cada clientes?
select c.idClient, Fname, count(*) as Number_of_Orders from clients c 
			inner join orders o on c.idClient = o.idOrderClient
			group by idClient;
                
   -- Filtros com WHERE Statement
-- Quais produtos são classificados como brinquedos e têm avaliação acima de 4.5?
SELECT Pname, Category, Evaluation FROM product
			WHERE Category = 'Brinquedos' AND Evaluation > 4.5;

-- Pedidos confirmados com valor de envio acima de R$10,00:
SELECT idOrder, orderDescription, freight FROM orders
			WHERE orderStatus = 'Confirmado' AND freight > 10;
            
-- Calcular o valor do frete estimado de um pedido (quantidade de produtos * valor de frete):
SELECT o.idOrder, o.orderDescription, (po.poQuantity * o.freight) AS ValorFreteEstimado
		FROM orders o
			JOIN productOrder po ON o.idOrder = po.idPOorder;
            
-- Lista de produtos ordenada pela avaliação de forma decrescente:
SELECT Pname, Category, Evaluation FROM product
			ORDER BY Evaluation DESC;
            
-- Fornecedores com mais de 50 produtos fornecidos no total:
SELECT s.socialName AS NomeFornecedor, SUM(ps.psQuantity) AS TotalProdutos
		FROM supplier s
			JOIN productSupplier ps ON s.idSupplier = ps.idPsSupplier
			GROUP BY s.idSupplier
			HAVING SUM(ps.psQuantity) > 50;
            
-- Algum vendedor também é fornecedor?
SELECT v.socialName AS NomeVendedorFornecedor FROM seller v
			JOIN supplier s ON v.CNPJ = s.CNPJ OR v.contact = s.contact;
            
-- Relação de produtos, fornecedores e estoques
SELECT p.Pname, s.socialName, ps.storageLocation FROM product p
				JOIN productSupplier psup ON p.idProduct = psup.idPsProduct
				JOIN supplier s ON psup.idPsSupplier = s.idSupplier
				JOIN storageLocation sl ON p.idProduct = sl.idSLproduct
				JOIN productStorage ps ON sl.idSLstorage = ps.idProdStorage;
                
-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT  s.socialName, p.Pname FROM supplier s
			JOIN productSupplier ps ON s.idSupplier = ps.idPsSupplier
			JOIN product p ON ps.idPsProduct = p.idProduct;