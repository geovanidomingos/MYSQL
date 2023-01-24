-- EXERCICIO 1
CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

-- Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os personagens do Game Online.
CREATE TABLE tb_classes(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    fase INT NOT NULL
);

-- Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens do Game Online.

CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    nivel INT NOT NULL,
    poder INT NOT NULL,
    vidas INT NOT NULL,
    fk_classes BIGINT NOT NULL,
	FOREIGN KEY (fk_classes) REFERENCES tb_classes(id)
);

-- Insira 5 registros na tabela tb_classes.

INSERT INTO tb_classes(nome, fase)
VALUES("Esmeralda", 1);
INSERT INTO tb_classes(nome, fase)
VALUES("Diamante", 2);
INSERT INTO tb_classes(nome, fase)
VALUES("Ouro", 3);
INSERT INTO tb_classes(nome, fase)
VALUES("Prata", 4);
INSERT INTO tb_classes(nome, fase)
VALUES("Bronze", 5);

-- Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes.

INSERT INTO tb_personagens(nome, nivel, poder, vidas, fk_classes)
VALUES("Miro", 4, 1500, 5, 3);
INSERT INTO tb_personagens(nome, nivel, poder, vidas, fk_classes)
VALUES("Nina", 5, 2100, 5, 4);
INSERT INTO tb_personagens(nome, nivel, poder, vidas, fk_classes)
VALUES("Bil", 2, 1100, 3, 2);
INSERT INTO tb_personagens(nome, nivel, poder, vidas, fk_classes)
VALUES("Dea", 3, 500, 2, 1);
INSERT INTO tb_personagens(nome, nivel, poder, vidas, fk_classes)
VALUES("John", 1, 1200, 1, 2);
INSERT INTO tb_personagens(nome, nivel, poder, vidas, fk_classes)
VALUES("Babi", 4, 2500, 3, 5);
INSERT INTO tb_personagens(nome, nivel, poder, vidas, fk_classes)
VALUES("Chay", 3, 1600, 2, 3);
INSERT INTO tb_personagens(nome, nivel, poder, vidas, fk_classes)
VALUES("Bento", 5, 2200, 4, 5);
INSERT INTO tb_personagens(nome, nivel, poder, vidas, fk_classes)
VALUES("Enoc", 5, 2300, 4, 5);
INSERT INTO tb_personagens(nome, nivel, poder, vidas, fk_classes)
VALUES("Victor", 3, 800, 2, 1);



SELECT * FROM tb_personagens;
SELECT * FROM tb_classes;
-- Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.

SELECT * FROM tb_personagens WHERE poder > 2000;

-- Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
SELECT * FROM tb_personagens WHERE poder < 2000 AND poder > 1000;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT * FROM tb_personagens
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
INNER JOIN tb_classes ON tb_classes.id = tb_personagens.fk_classes;

SELECT * FROM tb_personagens
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica
INNER JOIN tb_classes ON tb_classes.id = tb_personagens.fk_classes AND fk_classes = 4;


-- EXERCICIO 2

CREATE DATABASE db_pizzaria_fixe;

USE db_pizzaria_fixe;

-- Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária, relevantes aos produtos da pizzaria.

CREATE TABLE tb_pizzas(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(455) NOT NULL,
recheiodaborda VARCHAR(455) NOT NULL,
ingrediente VARCHAR(455) NOT NULL,
valor DOUBLE NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO tb_pizzas (nome, recheiodaborda, ingrediente, valor)
VALUES ("Portuguesa", "Catupiry", "Ovo,Ervilha,Cebola, Muçarela", 60.00);

INSERT INTO tb_pizzas (nome, recheiodaborda, ingrediente, valor)
VALUES ("Carne seca", "Sem recheio", "Carne seca desfiada,azeite,Cebola, Queijo", 70.00);

INSERT INTO tb_pizzas (nome, recheiodaborda, ingrediente, valor)
VALUES ("Queijo", "Catupiry", "Queijo", 40.00);

INSERT INTO tb_pizzas (nome, recheiodaborda, ingrediente, valor)
VALUES ("Marguerita", "Sem recheio", "Queijo, tomate, Oregano", 100.00 );

INSERT INTO tb_pizzas (nome, recheiodaborda, ingrediente, valor)
VALUES ("Chocolate com Morango", "Chocolate", "Chocolate com Morango", 50.00 );

INSERT INTO tb_pizzas (nome, recheiodaborda, ingrediente, valor)
VALUES ("Calabresa", "Catupiry", "Queijo, calabresa, Cebola", 80.00 );

INSERT INTO tb_pizzas (nome, recheiodaborda, ingrediente, valor)
VALUES ("Brócolis", "Catupiry", "Queijo, Queijo", 75.00);

INSERT INTO tb_pizzas (nome, recheiodaborda, ingrediente, valor)
VALUES ("Caponata", "Catupiry", "Molho de tomate natural, alho dourado, oregano", 75.00 );

USE db_pizzaria_fixe;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(255) NOT NULL,
tipodemassa VARCHAR(255) NOT NULL
);

INSERT INTO tb_categorias(descricao,tipodemassa) VALUES ("PIZZA VEGETARIANA","Massa sem derivados animais");
INSERT INTO tb_categorias(descricao, tipodemassa) VALUES ("PIZZA SALGADA COM CARNE ANIMAL","Massa com derivados animais");
INSERT INTO tb_categorias(descricao, tipodemassa) VALUES ("PIZZA DOCE","Massa com derivados animais");


SELECT * FROM tb_categorias;
ALTER TABLE tb_pizzas ADD categorias_id BIGINT;

ALTER TABLE tb_pizzas ADD CONSTRAINT
FOREIGN KEY (categorias_id) REFERENCES tb_categorias(id);



INSERT INTO tb_pizzas (nome, recheiodaborda, ingrediente, valor, categorias_id) 
VALUES ("Banana com chocolate", "Chocolate", "Banana e Chocolate", 72.00, 1);

INSERT INTO tb_pizzas (nome, recheiodaborda, ingrediente, valor,categorias_id) 
VALUES ("Tomate seco", "Sem recheio", "Tomate seco", 88.00, 3);

INSERT INTO tb_pizzas (nome, recheiodaborda, ingrediente, valor, categorias_id) 
VALUES ("Carne", "Catupery", "Cebola, Carne, Azeitona", 99.00, 2);

INSERT INTO tb_pizzas (nome, recheiodaborda, ingrediente, valor, categorias_id) 
VALUES ("Carne", "Catupery", "Cebola, Carne, Azeitona, Champion", 99.00, 2 );

SELECT * FROM tb_pizzas
INNER JOIN tb_categorias ON tb_categorias.id = tb_pizzas.categorias_id;

SELECT * FROM tb_pizzas 
LEFT JOIN tb_categorias ON tb_categorias.id = tb_pizzas.categorias_id;

SELECT nome, recheiodaborda, ingrediente, valor, descricao, tipodemassa FROM tb_pizzas 
RIGHT JOIN tb_categorias ON tb_categorias.id = tb_pizzas.categorias_id;

SELECT * FROM tb_categorias

RIGHT JOIN tb_pizzas ON tb_pizzas.categorias_id = tb_categorias.id;

SELECT * FROM tb_pizzas

 
INNER JOIN tb_categorias ON tb_pizzas.categorias_id=tb_categorias.id;

SELECT * FROM tb_pizzas INNER JOIN tb_categorias ON tb_pizzas.categorias_id = tb_categorias.id AND categorias_id = 1;

SELECT * FROM tb_pizzas WHERE valor > 45.00;

SELECT * FROM tb_pizzas WHERE valor > 50.00 AND valor < 100;

SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';



UPDATE tb_pizzas SET categorias_id = 2 WHERE id = 1;
UPDATE tb_pizzas SET categorias_id = 2 WHERE id = 2;
UPDATE tb_pizzas SET categorias_id = 3 WHERE id = 3;
UPDATE tb_pizzas SET categorias_id = 3 WHERE id = 4;
UPDATE tb_pizzas SET categorias_id = 1 WHERE id = 5;
UPDATE tb_pizzas SET categorias_id = 2 WHERE id = 6;
UPDATE tb_pizzas SET categorias_id = 3 WHERE id = 7;
UPDATE tb_pizzas SET categorias_id = 3 WHERE id = 8;
SELECT * FROM tb_pizzas;