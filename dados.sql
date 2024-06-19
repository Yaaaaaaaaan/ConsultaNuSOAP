drop database dadosConsulta;
create database dadosConsulta;
use dadosConsulta;

create table consulta(
    cod INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(255) not null unique,
    descricao text null,
    endereco varchar(255) null,
    usuario varchar(50) null
);

create table contas(
    cod INT PRIMARY KEY AUTO_INCREMENT,
    data datetime DEFAULT CURRENT_TIMESTAMP,
    multa DECIMAL(9,2) NULL DEFAULT '0.00',
    debito DECIMAL(9,2) NULL DEFAULT '0.00',
    codigoConsulta INT not null,
    FOREIGN KEY(codigoConsulta) REFERENCES consulta(cod)
);

INSERT INTO consulta (nome, descricao, endereco, usuario) VALUES ('Ana Silva', 'Consulta médica de rotina', 'Rua das Flores, 123, São Paulo', 'asilva');
INSERT INTO consulta (nome, descricao, endereco, usuario) VALUES ('Bruno Costa', 'Consulta médica de rotina', 'Avenida Brasil, 456, Rio de Janeiro', 'bcosta');
INSERT INTO consulta (nome, descricao, endereco, usuario) VALUES ('Carlos Pereira', 'Consulta médica de rotina', 'Rua da Paz, 789, Belo Horizonte', 'cpereira');
INSERT INTO consulta (nome, descricao, endereco, usuario) VALUES ('Daniela Almeida', 'Consulta médica de rotina', 'Travessa dos Pioneiros, 101, Curitiba', 'dalmeida');
INSERT INTO consulta (nome, descricao, endereco, usuario) VALUES ('Eduardo Santos', 'Consulta médica de rotina', 'Rua do Comércio, 202, Porto Alegre', 'esantos');
INSERT INTO consulta (nome, descricao, endereco, usuario) VALUES ('Fernanda Oliveira', 'Consulta médica de rotina', 'Avenida Central, 303, Brasília', 'foliveira');
INSERT INTO consulta (nome, descricao, endereco, usuario) VALUES ('Gustavo Lima', 'Consulta médica de rotina', 'Rua dos Artistas, 404, Salvador', 'glima');
INSERT INTO consulta (nome, descricao, endereco, usuario) VALUES ('Helena Rocha', 'Consulta médica de rotina', 'Avenida das Nações, 505, Recife', 'hrocha');
INSERT INTO consulta (nome, descricao, endereco, usuario) VALUES ('Isabela Ribeiro', 'Consulta médica de rotina', 'Rua do Porto, 606, Fortaleza', 'iribero');
INSERT INTO consulta (nome, descricao, endereco, usuario) VALUES ('João Mendes', 'Consulta médica de rotina', 'Avenida Independência, 707, Manaus', 'jmendes');


INSERT INTO contas (multa, debito, codigoConsulta) VALUES (10.50, 200.00, 1);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (15.75, 150.00, 2);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (0.00, 500.00, 3);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (5.00, 300.00, 4);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (8.25, 100.00, 5);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (0.00, 400.00, 6);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (12.00, 250.00, 7);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (0.00, 350.00, 8);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (7.50, 600.00, 9);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (20.00, 50.00, 10);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (11.00, 210.00, 1);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (14.50, 170.00, 2);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (0.00, 520.00, 3);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (6.00, 310.00, 4);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (9.25, 110.00, 5);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (0.00, 420.00, 6);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (13.00, 260.00, 7);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (0.00, 370.00, 8);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (8.50, 620.00, 9);
INSERT INTO contas (multa, debito, codigoConsulta) VALUES (21.00, 70.00, 10);
