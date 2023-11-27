SELECT * FROM produto;
SELECT * FROM estoque;
SELECT * FROM cidade;
SELECT * FROM farmacia;
SELECT * FROM estados;
SELECT * FROM venda;
SELECT * FROM clientes;
SELECT * FROM pedidofornecedor;


/*COMANDOS PARA CRIAÇÃO DAS TABELAS E SEUS RELACIONAMENTOS*/

CREATE TABLE gerente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone1 VARCHAR(20),
    telefone2 VARCHAR(20),
    email VARCHAR(100)
);



/*COMANDOS PARA POPULAÇÃO DAS TABELAS*/

INSERT INTO gerente (nome, telefone1, telefone2, email)
VALUES
    ('Joaquim', '(61) 99898-9898', '(61) 1234-1234', 'j.100vendas@axpto.com'),
    ('Marcão', '(61) 99895-9898', '(61) 1235-1234', 'marcao.exgerente@zxpto.com');
-- Adicione mais linhas conforme necessário

/*COMANDOS PARA A CONSULTA 1*/

SELECT
    produto.id AS Codigo,
    produto.nome AS Nome,
    produto.fabricante AS Fabricante,
    SUM(estoque.quantidade) AS Quantidade,
    cidade.nome AS Cidade,
    estados.nome AS UF
FROM
    produto
JOIN
    estoque ON produto.id = estoque.produto_id
JOIN
    farmacia ON farmacia.id = estoque.farmacia_id
JOIN
    cidade ON cidade.id = farmacia.cidade_id
JOIN
    estados ON estados.id = cidade.estados_id
WHERE
    cidade.id = 145
GROUP BY
    produto.id, produto.nome, produto.fabricante, cidade.nome, estados.nome
ORDER BY
    produto.nome ASC
LIMIT 0, 1000;

/*-----------------------------------------------------------------------------------------------------------------------------------------------*/

/*COMANDOS PARA A CONSULTA 2*/

SELECT
    clientes.id AS id,
    clientes.nome AS nome,
    clientes.telefone AS telefone,
    clientes.idade AS idade,
    COUNT(venda.id) AS nr_de_compras
FROM
    clientes
JOIN
    venda ON clientes.id = venda.cliente_id
WHERE
    venda.estado_id = 278
GROUP BY
    clientes.id, clientes.nome, clientes.telefone, clientes.idade
ORDER BY
    nr_de_compras DESC
LIMIT 0, 1000;

/*-----------------------------------------------------------------------------------------------------------------------------------------------*/

/*COMANDOS PARA A CONSULTA 3*/

SELECT
    venda.id AS id_compra,
    clientes.nome AS cliente,
    venda.valor_total,
    venda.plataforma,
    venda.data_hora
FROM
    venda
JOIN
    clientes ON clientes.id = venda.cliente_id
WHERE
    (venda.plataforma = 'loja' OR venda.plataforma = 'portal')  
    AND venda.data_hora BETWEEN '2023-11-14 00:00:00' AND '2023-11-15 23:59:59'  -- Restringindo para compras entre os dias 14 e 15 de novembro
ORDER BY
    venda.data_hora;
    
/*-----------------------------------------------------------------------------------------------------------------------------------------------*/

/*COMANDOS PARA A CONSULTA 4*/

SELECT
    clientes.id AS id,
    clientes.nome,
    clientes.telefone,
    clientes.idade,
    COUNT(venda.id) AS total_vendas_ultimo_ano
FROM
    clientes
LEFT JOIN
    venda ON clientes.id = venda.cliente_id
           AND venda.data_hora >= CURDATE() - INTERVAL 30 DAY
WHERE
    venda.id
GROUP BY
    clientes.id, clientes.nome, clientes.telefone, clientes.idade
ORDER BY
    clientes.nome;
    
/*-----------------------------------------------------------------------------------------------------------------------------------------------*/

/*COMANDOS PARA A CONSULTA 5*/

SELECT
    produto.id AS codigo,
    produto.nome,
    produto.fabricante,
    estoque.quantidade,
    produto.lote_id AS lote,
    pedidofornecedor.vencimento
FROM
    produto
JOIN
    estoque ON produto.id = estoque.produto_id
JOIN
    pedidofornecedor ON produto.lote_id = pedidofornecedor.lote
WHERE
    produto.id = 203 
ORDER BY
    pedidofornecedor.vencimento, produto.lote_id;
    
/*-----------------------------------------------------------------------------------------------------------------------------------------------*/

/*COMANDOS PARA A CONSULTA 6*/

SELECT
    produto.id,
    produto.nome,
    produto.fabricante,
    COUNT(venda.id) AS qtd_vendas
FROM
    produto
JOIN
    venda ON produto.id = venda.produto_id
JOIN
    farmacia ON venda.farmacia_id = farmacia.id
WHERE
    farmacia.cidade_id = 545  
GROUP BY
    produto.id, produto.nome, produto.fabricante
ORDER BY
    qtd_vendas DESC
LIMIT 10;

/*-----------------------------------------------------------------------------------------------------------------------------------------------*/

/*COMANDOS PARA A CONSULTA 7*/

SELECT
    produto.nome AS produto,
    produto.fabricante,
    farmacia.nome AS farmacia,
    cidade.nome AS cidade,
    estados.nome AS uf,
    COUNT(venda.id) AS qtd_vendas
FROM
    produto
JOIN
    venda ON produto.id = venda.produto_id
JOIN
    farmacia ON venda.farmacia_id = farmacia.id
JOIN
    clientes ON venda.cliente_id = clientes.id
JOIN
    cidade ON farmacia.cidade_id = cidade.id
JOIN
    estados ON cidade.estados_id = estados.id
WHERE
    produto.id = 202
    AND venda.data_hora >= CURDATE() - INTERVAL 30 DAY
    AND venda.plataforma = 'aplicativo'
GROUP BY
    produto.id, produto.nome, produto.fabricante, farmacia.id, farmacia.nome, cidade.nome, estados.nome
ORDER BY
    qtd_vendas DESC
LIMIT 0, 1000;

    
    SELECT *
FROM venda
WHERE produto_id = 202
    AND data_hora >= CURDATE() - INTERVAL 30 DAY;

    
    -- Inserir uma venda para o produto 202 nos últimos 30 dias via aplicativo em uma farmácia


SELECT *
FROM venda
WHERE data_hora >= CURDATE() - INTERVAL 30 DAY;




/*-----------------------------------------------------------------------------------------------------------------------------------------------*/

/*COMANDOS PARA A CONSULTA 8*/

SELECT
    farmacia.nome AS farmacia,
    gerente.nome AS gerente,
    gerente.telefone1,
    gerente.telefone2,
    gerente.email
FROM
    venda
JOIN
    farmacia ON venda.farmacia_id = farmacia.id
JOIN
    gerente ON farmacia.gerente_id = gerente.id
JOIN
    produto ON venda.produto_id = produto.id
WHERE
    produto.id = 202
    AND venda.data_hora >= CURDATE() - INTERVAL 30 DAY
GROUP BY
    farmacia.id, farmacia.nome, gerente.id, gerente.nome, gerente.telefone1, gerente.telefone2, gerente.email
ORDER BY
    SUM(venda.quantidade) ASC
LIMIT 3;

/*-----------------------------------------------------------------------------------------------------------------------------------------------*/

/*COMANDOS PARA A CONSULTA 9*/

SELECT
    entregador.nome AS entregador,
    AVG(venda.valor_total) AS ticket_medio
FROM
    venda
JOIN
    entregador ON venda.entregador_id = entregador.id
WHERE
    venda.delivered = 1  -- Supondo que 1 representa "sim" para retirada por entregador
    AND entregador.nome = 'Marco Silva'  -- Substitua pelo nome do entregador desejado
GROUP BY
    entregador.id, entregador.nome;
    
    
/*COMANDOS PARA CRIAÇÃO E EXEMPLO DE USO DA VIEW*/

CREATE VIEW clientes_acima_de_25 AS
SELECT id_cliente, nome, idade
FROM clientes
WHERE idade > 25;

/*COMANDOS PARA CRIAÇÃO E EXEMPLO DE USO DA FUNÇÃO*/

DELIMITER //
CREATE FUNCTION concatenar_strings(str1 VARCHAR(255), str2 VARCHAR(255))
RETURNS VARCHAR(255)
BEGIN
    DECLARE resultado VARCHAR(255);
    SET resultado = CONCAT(str1, str2);
    RETURN resultado;
END //
DELIMITER ;

SELECT concatenar_strings('Olá', ' Mundo') AS resultado_concatenado;

/*COMANDOS PARA CRIAÇÃO E EXEMPLO DE USO DA STORED PROCEDURE*/

DELIMITER //
CREATE PROCEDURE inserir_cliente(IN nome_cliente VARCHAR(255), IN idade_cliente INT, IN id_cliente INT)
BEGIN
    INSERT INTO clientes (id, nome, idade) VALUES (id_cliente, nome_cliente, idade_cliente);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS inserir_cliente;

CALL inserir_cliente('João Silva', 30, 1234); 

/*COMANDOS PARA CRIAÇÃO E EXEMPLO DE USO DA TRIGGER*/

DELIMITER //
CREATE TRIGGER after_delete_cliente
AFTER DELETE
ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO log_clientes (acao, descricao, data_registro) 
    VALUES ('Exclusão', CONCAT('Cliente excluído: ', OLD.nome), NOW());
END;
//
DELIMITER ;


CREATE TABLE log_clientes (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    acao VARCHAR(255),
    descricao VARCHAR(255),
    data_registro TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_delete_cliente
AFTER DELETE
ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO log_clientes (acao, descricao, data_registro) 
    VALUES ('Exclusão', CONCAT('Cliente excluído: ', OLD.nome), NOW());
END;
//
DELIMITER ;

-- Inserindo alguns clientes
INSERT INTO clientes (id,nome, idade) VALUES (157, 'Alice', 25), (953, 'Bob', 30), (753, 'Charlie', 28);

-- Excluindo um cliente (acionando a trigger)
DELETE FROM clientes WHERE id = 157;

-- Verificando a tabela de log (log_clientes)
SELECT * FROM log_clientes;
