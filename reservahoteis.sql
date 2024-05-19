CREATE DATABASE reserva_hoteis; 

use reserva_hoteis;

CREATE TABLE CLIENTE(
	nome_completo VARCHAR(100),
	cpf VARCHAR(20),
	idade INTEGER,
	user_name VARCHAR(30),
	senha VARCHAR(100),
	email VARCHAR(100),
	PRIMARY KEY(cpf, user_name)
);

CREATE TABLE Hotel (
    Id_hotel INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Estado VARCHAR(100) NOT NULL,
    Pais VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Quarto (
    Id_quarto INT PRIMARY KEY AUTO_INCREMENT,
    Id_hotel INT,
    NumeroQuarto VARCHAR(10) NOT NULL,
    TipoQuarto VARCHAR(50) NOT NULL, 
    Preco DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL, 
    FOREIGN KEY (Id_hotel) REFERENCES Hotel(id_hotel)
);

CREATE TABLE Reserva (
    Id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    Id_quarto INT,
    DataCheckIn DATE NOT NULL,
    DataCheckOut DATE NOT NULL,
    Status VARCHAR(50) NOT NULL, 
    FOREIGN KEY (Id_quarto) REFERENCES Quarto(Id_quarto)
);


–Essa tabela é para cadastrar varios clientes em um quarto–

CREATE TABLE ReservaCliente (
    Id_reserva INT,
    cpf_cliente VARCHAR(20),
    user_name_cliente VARCHAR(30),
    PRIMARY KEY (Id_reserva, cpf_cliente, user_name_cliente),
    FOREIGN KEY (Id_reserva) REFERENCES Reserva(Id_reserva),
    FOREIGN KEY (cpf_cliente, user_name_cliente) REFERENCES CLIENTE(cpf, user_name)
);

INSERÇÕES

INSERT INTO Hotel (Nome, cnpj, Endereco, Cidade, Estado, Pais, Telefone, Email) VALUES ('Hotel Prime', '123.456.789/0001-01', 'Rua cinco, 123', 'ilheus', 'Bahia', 'Brasil', '733456-7890', 'contato@hotelprime.com')	

INSERT INTO Hotel (Nome, cnpj, Endereco, Cidade, Estado, Pais, Telefone, Email)
VALUES ('Hotel Aldeia', '234.567.890/0001-02', 'Avenida Olivenca, 456', 'ilheus', 'Bahia', 'Brasil', '732345-6789', 'contato@hotelaldeia.com');

INSERT INTO Hotel (Nome, cnpj, Endereco, Cidade, Estado, Pais, Telefone, Email)
VALUES ('Hotel Premium', '345.678.901/0001-03', 'Travessa dois, 789', 'ilheus', 'Bahia', 'Brasil', '733456-7890', 'contato@hotelpremium.com');


INSERT INTO Quarto (Id_hotel, NumeroQuarto, TipoQuarto, Preco, Status)
VALUES 
    (3, '101', 'Standard', 150.00, 'Disponível'),
    (3, '102', 'Standard', 150.00, 'Disponível'),
    (3, '201', 'Luxo', 250.00, 'Disponível');


INSERT INTO Quarto (Id_hotel, NumeroQuarto, TipoQuarto, Preco, Status)
VALUES 
    (4, '101', 'Standard', 120.00, 'Disponível'),
    (4, '201', 'Luxo', 200.00, 'Disponível'),
    (4, '202', 'Luxo', 200.00, 'Disponível');


INSERT INTO Quarto (Id_hotel, NumeroQuarto, TipoQuarto, Preco, Status)
VALUES 
    (5, '101', 'Standard', 170.00, 'Disponível'),
    (5, '102', 'Standard', 170.00, 'Disponível'),
    (5, '202', 'Luxo', 280.00, 'Disponível');

