-- Criação do bando de dados para o cenário de E-Commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    Email varchar(100) not null,
    Cellphone varchar(15),
    HomePhone varchar(15),
    Address varchar(255),
    constraint unique_email unique(Email)
);
desc clients;
alter table clients auto_increment = 1;

-- criar tabela pessoa fisica
create table physicalPerson (
    idClient int primary key,
    CPF char(11) not null,
    RG varchar(20),
    DateNasc DATE,
	constraint unique_cpf unique(CPF),
    constraint fk_physicalperson_clients foreign key (idClient) references clients(idClient)
        on delete cascade
        on update cascade
);
desc physicalPerson;

-- criar tabela pessoa juridica
create table LegalPerson (
    idClient int primary key,
    CNPJ char(14) not null,
    socialName varchar(100),
    StateRegistration varchar(20),
    constraint unique_cnpj unique(CNPJ),
    constraint fk_LegalPerson_clients foreign key (idClient) references clients(idClient)
        on delete cascade
        on update cascade
);
desc LegalPerson;

-- criar tabela product
-- size = dimensão do produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    Classification_kids bool default false,
    Category enum('Eletrônico', 'Vestimentas','Brinquedos','Alimentos','Móveis') not null,
    ProductDescription varchar(255),
    SellingPrice decimal(10,2),
    CostPrice decimal(10,2),
    Evaluation float default 0,
    Size varchar(10)
);
desc product;
alter table product auto_increment = 1;

-- criar tabela pedidos
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderDate datetime not null,
    orderStatus enum('Cancelado', 'Confirmado','Em Processamento') default 'Em Processamento',
    orderDescription varchar(255),
    freight float default 10,
	constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
			on update cascade
);
desc orders;
alter table orders auto_increment = 1;

-- criar tabela entrega
create table delivery(
	idDelivery int auto_increment primary  key,
	idOrder int not null,
	departureDate datetime not null,
	expectedDeliveryDate date not null,
	actualDeliveryDate date,
	deliveryCost decimal(10, 2),
	carrier varchar(50),
	deliveryStatus enum('Pendente', 'Em Transporte', 'Entregue', 'Cancelada'),
	address varchar(255),
	constraint fk_delivery_orders foreign key (idOrder) references orders(idOrder)
			on delete cascade
			on update cascade
);
desc delivery;
alter table delivery auto_increment = 1;

-- criar tabela forma de pagamentos
create table paymentForms (
	idPaymentForm int auto_increment primary key,
	paymentType enum('Cartão de Crédito', 'Cartão de Débito', 'Boleto', 'Pix', 'Transferência Bancária'),
	paymentFormName varchar(100),
	cardNumber varchar(16),
	cardName varchar(100),
	cardValidity date,
	CVV char(3), 
	pixKey varchar(100),
	billCode varchar(50),
	bankTransfer varchar(100),
	agencyTransfer varchar(10),
	accountTransfer varchar(20),
	installmentsAllowed int,
	installmentInterestRate decimal(5, 2),
	dueDate date,
	observations Varchar(255),
	asset boolean default true
);
desc paymentForms;
alter table paymentForms auto_increment = 1;

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0,
    maxCapacity int,
    UpdateDate datetime not null,
    constraint ck_maxCapacity_quantity check(quantity < maxCapacity)
);
desc productStorage;
alter table productStorage auto_increment = 1;


-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    Email varchar(100) not null,
    address varchar(255),
	constraint unique_supplier unique(CNPJ)
);
desc supplier;
alter table supplier auto_increment = 1;


-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    abstName varchar(255),
    CNPJ char(15),
    CPF char(9),
	location varchar(255),
    contact char(11) not null,
	constraint unique_cnpj_seller unique(CNPJ),
    constraint unique_cpf_seller unique(CPF)
);
desc seller;
alter table seller auto_increment = 1;


-- criar tabela produto_vendedor(terceiros)
create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller,idPproduct),
	constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_productSeller_product foreign key (idPproduct) references product(idProduct)
);
desc productSeller;

-- criar tabela produto_pedido
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponivel','Sem Estoque') default 'Disponivel',
    primary key (idPOproduct,idPOorder),
	constraint fk_product_order foreign key (idPOorder) references orders(idOrder),
    constraint fk_productOrder_product foreign key (idPOproduct) references product(idProduct)
);
desc productOrder;

-- criar tabela pedido_formas de pagamento
create table ordersPaymentForms (
	idOPForder int,
	idOPFpaymentForms int,
	ValuePaid decimal(10, 2) not null,
	Installments int default 1,
	DatePayment datetime not null,
	StatusPayment enum('Pendente', 'Concluído', 'Cancelado') default 'Pendente',
	ProofPayment varchar(255),
	primary key (idOPForder, idOPFpaymentForms),
	constraint fk_ordersPaymentForms_orders foreign key (idOPForder) references orders(idOrder)
			on delete cascade
			on update cascade,
	constraint fk_ordersPaymentForms_paymentForms foreign key (idOPFpaymentForms) references paymentForms(idPaymentForm)
			on delete cascade
			on update cascade
);
desc ordersPaymentForms;

-- criar tabela produto_estoque
create table storageLocation(
	idSLproduct int, 
	idSLstorage int,
    Location varchar(255) not null,
    primary key (idSLproduct,idSLstorage),
	constraint fk_productStorage_storage foreign key (idSLstorage) references productStorage(idProdStorage),
    constraint fk_productStorage_product foreign key (idSLproduct) references product(idProduct)
);
desc storageLocation;

-- criar tabela produto_fornecedor
create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    psQuantity int not null,
    primary key (idPsSupplier,idPsProduct),
	constraint fk_product_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_productSupplier_product foreign key (idPsProduct) references product(idProduct)
);
desc productSupplier;
show tables;
use information_schema;
select * from referential_constraints where constraint_schema = 'ecommerce';
