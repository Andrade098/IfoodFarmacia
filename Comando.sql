-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: farmacia
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacoes` (
  `id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_id_idx` (`cliente_id`),
  KEY `fk_produto_id_idx` (`produto_id`),
  CONSTRAINT `fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_produto_id` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoes`
--

LOCK TABLES `avaliacoes` WRITE;
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
INSERT INTO `avaliacoes` VALUES (401,523,205,'2023-11-01','Ótimo produto, entrega rápida!'),(402,423,204,'2023-11-02','Produto de qualidade, recomendo.'),(403,323,203,'2023-11-03','Entrega atrasou um pouco, mas o produto é bom.'),(404,223,202,'2023-11-04','Excelente atendimento, chegou no prazo.'),(405,123,201,'2023-11-05','Produto com defeito, espero solução rápida.');
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cep` int DEFAULT NULL,
  `estados_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estados_id_idx` (`estados_id`),
  CONSTRAINT `fk_estados_id` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (145,'São Paulo',1000000,578),(245,'Campinas',13000000,478),(345,'Rio de Janeiro',20000000,378),(445,'Belo Horizonte',30000000,278),(545,'Salvador',40000000,178),(546,'Cidade XYZ',NULL,378);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `endereco_id` int DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_endereco_id_idx` (`endereco_id`),
  CONSTRAINT `fk_endereco_id` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (123,1005,'João Silva','123-456-7890','123.456.789-01',30,'joao@email.com','senha123'),(223,1004,'Maria Oliveira','987-654-3210','987.654.321-02',25,'maria@email.com','senha456'),(323,1003,'Pedro Santos','111-222-3333','111.222.333-03',35,'pedro@email.com','senha789'),(423,1002,'Ana Lima','555-444-3333','555.444.333-04',28,'ana@email.com','senhaabc'),(523,1001,'Carlos Rocha','777-888-9999','777.888.999-05',40,'carlos@email.com','senhaxyz'),(753,NULL,'Charlie',NULL,NULL,28,NULL,NULL),(953,NULL,'Bob',NULL,NULL,30,NULL,NULL),(1234,NULL,'João Silva',NULL,NULL,30,NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cidade_id` int DEFAULT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1001,545,'Avenida Paulista',123,'Apto 456','Próximo ao metrô','1310000','Bela Vista'),(1002,445,'Rua Barão de Jaguara',789,'Casa 101','Esquina com a Rua 3','13015000','Centro'),(1003,345,'Copacabana Beach',456,'Bloco 789','Em frente ao mercado','22000001','Copacabana'),(1004,245,'Praça da Liberdade',1010,'Sala 205','Ao lado do parque','30140001','Funcionários'),(1005,145,'Avenida Tancredo Neves',777,'Loja 303','No shopping','41820020','Caminho das Árvores');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `entregador_id` int DEFAULT NULL,
  `itenspedido_id` int DEFAULT NULL,
  `receita_id` int DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_id_idx` (`cliente_id`),
  KEY `fk_itenspedido_id_idx` (`itenspedido_id`),
  KEY `fk_entregador_id_idx` (`entregador_id`),
  CONSTRAINT `fk_cliente_id_entrega` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_entregador_id_entrega` FOREIGN KEY (`entregador_id`) REFERENCES `entregador` (`id`),
  CONSTRAINT `fk_itenspedido_id_entrega` FOREIGN KEY (`itenspedido_id`) REFERENCES `itenspedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (3001,523,599,605,1105,'Rua A, 123','2023-11-01'),(3002,423,499,604,1104,'Rua B, 456','2023-11-02'),(3003,323,399,603,1103,'Rua C, 789','2023-11-03'),(3004,223,299,602,1102,'Rua D, 101','2023-11-04'),(3005,123,199,601,1101,'Rua E, 112','2023-11-05');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregador`
--

DROP TABLE IF EXISTS `entregador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregador` (
  `id` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cotacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregador`
--

LOCK TABLES `entregador` WRITE;
/*!40000 ALTER TABLE `entregador` DISABLE KEYS */;
INSERT INTO `entregador` VALUES (199,'Marco Silva','111.222.333-01',28,'Rua A, 123','R$5 por entrega'),(299,'Julia Oliveira','222.333.444-02',35,'Rua B, 456','R$6 por entrega'),(399,'Ricardo Santos','333.444.555-03',30,'Rua C, 789','R$4 por entrega'),(499,'Camila Lima','444.555.666-04',45,'Rua D, 101','R$7 por entrega'),(599,'Lucas Souza','555.666.777-05',32,'Rua E, 112','R$6.50 por entrega');
/*!40000 ALTER TABLE `entregador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `sigla` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=579 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (178,'São Paulo','SP'),(278,'Rio de Janeiro','RJ'),(378,'Minas Gerais','MG'),(478,'Bahia','BA'),(578,'Paraná','PR');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id` int NOT NULL,
  `produto_id` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `farmacia_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_farmacia_id_idx` (`farmacia_id`),
  CONSTRAINT `fk_estoque_farmacia` FOREIGN KEY (`farmacia_id`) REFERENCES `farmacia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (301,205,50,100100),(302,204,30,200200),(303,203,100,300300),(304,202,75,400400),(305,201,40,500500);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmacia`
--

DROP TABLE IF EXISTS `farmacia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmacia` (
  `id` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cidade_id` int DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `gerente_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade_id` (`cidade_id`),
  KEY `fk_estado_id_farmacia_idx` (`estado_id`),
  KEY `fk_gerente` (`gerente_id`),
  CONSTRAINT `farmacia_ibfk_1` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`),
  CONSTRAINT `fk_estado_id_farmacia` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`),
  CONSTRAINT `fk_gerente` FOREIGN KEY (`gerente_id`) REFERENCES `gerente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmacia`
--

LOCK TABLES `farmacia` WRITE;
/*!40000 ALTER TABLE `farmacia` DISABLE KEYS */;
INSERT INTO `farmacia` VALUES (100100,'Drogasil',145,578,777),(200200,'Rosario',245,478,778),(300300,'Drogafuji',345,378,779),(400400,'Atacadao',445,278,NULL),(500500,'Saude',545,178,NULL);
/*!40000 ALTER TABLE `farmacia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id` int NOT NULL,
  `produto_id` int DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `contato` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto_id_fornecedor_idx` (`produto_id`),
  CONSTRAINT `fk_produto_id_fornecedor` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (801,203,'Laboratórios Farmacêuticos S.A.','João Silva'),(802,202,'Distribuidora de Medicamentos ABC','Maria Oliveira'),(803,201,'Indústria Farmacêutica Nacional','Pedro Santos'),(804,205,'Importadora de Produtos Médicos','Ana Lima'),(805,204,'Fornecedora de Suprimentos Hospitalares','Carlos Rocha');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerente`
--

DROP TABLE IF EXISTS `gerente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `telefone1` varchar(20) DEFAULT NULL,
  `telefone2` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=780 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerente`
--

LOCK TABLES `gerente` WRITE;
/*!40000 ALTER TABLE `gerente` DISABLE KEYS */;
INSERT INTO `gerente` VALUES (777,'Joaquim','(61) 99898-9898','(61) 1234-1234','j.100vendas@axpto.com'),(778,'Marcão','(61) 99895-9898','(61) 1235-1234','marcao.exgerente@zxpto.com'),(779,'Joaquim','(61) 99898-9898','(61) 1234-1234','j.100vendas@axpto.com');
/*!40000 ALTER TABLE `gerente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imgproduto`
--

DROP TABLE IF EXISTS `imgproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imgproduto` (
  `id` int NOT NULL,
  `produto_id` int DEFAULT NULL,
  `arquivo` blob,
  PRIMARY KEY (`id`),
  KEY `fk_produto_id_imgproduto_idx` (`produto_id`),
  CONSTRAINT `fk_produto_id_imgproduto` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imgproduto`
--

LOCK TABLES `imgproduto` WRITE;
/*!40000 ALTER TABLE `imgproduto` DISABLE KEYS */;
INSERT INTO `imgproduto` VALUES (901,202,_binary 'conteúdo_binário1'),(902,203,_binary 'conteúdo_binário2'),(903,201,_binary 'conteúdo_binário3'),(904,204,_binary 'conteúdo_binário4'),(905,205,_binary 'conteúdo_binário5');
/*!40000 ALTER TABLE `imgproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itenspedido`
--

DROP TABLE IF EXISTS `itenspedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itenspedido` (
  `id` int NOT NULL,
  `pedido_id` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto_id_itenspedidos_idx` (`produto_id`),
  KEY `fk_cliente_id_itenspedidos_idx` (`cliente_id`),
  KEY `fk_pedido_id_itenspedidos_idx` (`pedido_id`),
  CONSTRAINT `fk_cliente_id_itenspedidos` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_pedido_id_itenspedidos` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `fk_produto_id_itenspedidos` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itenspedido`
--

LOCK TABLES `itenspedido` WRITE;
/*!40000 ALTER TABLE `itenspedido` DISABLE KEYS */;
INSERT INTO `itenspedido` VALUES (601,503,523,201,2),(602,502,423,202,1),(603,501,323,203,3),(604,505,223,204,2),(605,504,123,205,1);
/*!40000 ALTER TABLE `itenspedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_clientes`
--

DROP TABLE IF EXISTS `log_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_clientes` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `acao` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data_registro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_clientes`
--

LOCK TABLES `log_clientes` WRITE;
/*!40000 ALTER TABLE `log_clientes` DISABLE KEYS */;
INSERT INTO `log_clientes` VALUES (1,'Exclusão','Cliente excluído: Alice','2023-11-27 02:33:25');
/*!40000 ALTER TABLE `log_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logincliente`
--

DROP TABLE IF EXISTS `logincliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logincliente` (
  `id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_id_logincliente_idx` (`cliente_id`),
  CONSTRAINT `fk_cliente_id_logincliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logincliente`
--

LOCK TABLES `logincliente` WRITE;
/*!40000 ALTER TABLE `logincliente` DISABLE KEYS */;
INSERT INTO `logincliente` VALUES (5011,523,'joao123'),(5022,423,'maria456'),(5033,323,'pedro789'),(5044,123,'ana_lima'),(5055,223,'carlos_rocha');
/*!40000 ALTER TABLE `logincliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginvendedor`
--

DROP TABLE IF EXISTS `loginvendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loginvendedor` (
  `id` int NOT NULL,
  `vendedor_id` int DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendedor_id_login_vendedor_idx` (`vendedor_id`),
  CONSTRAINT `fk_vendedor_id_login_vendedor2` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginvendedor`
--

LOCK TABLES `loginvendedor` WRITE;
/*!40000 ALTER TABLE `loginvendedor` DISABLE KEYS */;
INSERT INTO `loginvendedor` VALUES (10001,111,'joao123'),(10002,222,'maria456'),(10003,333,'pedro789'),(10004,444,'ana_lima'),(10005,555,'carlos_rocha');
/*!40000 ALTER TABLE `loginvendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id` int NOT NULL,
  `forma_pagamento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1201,'Cartão de Crédito'),(1202,'Boleto Bancário'),(1203,'Transferência Bancária'),(1204,'Dinheiro'),(1205,'Cheque');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidofornecedor`
--

DROP TABLE IF EXISTS `pedidofornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidofornecedor` (
  `id` int NOT NULL,
  `fornecedor_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `lote` varchar(255) DEFAULT NULL,
  `valor_total` double DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto_id_pedido_fornecedor_idx` (`produto_id`),
  KEY `fk_fornecedor_id_idx` (`fornecedor_id`),
  CONSTRAINT `fk_fornecedor_id` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id`),
  CONSTRAINT `fk_produto_id_pedido_fornecedor` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidofornecedor`
--

LOCK TABLES `pedidofornecedor` WRITE;
/*!40000 ALTER TABLE `pedidofornecedor` DISABLE KEYS */;
INSERT INTO `pedidofornecedor` VALUES (11001,801,201,'2023-11-01','Lote123',500,100,'2024-12-01'),(11002,803,203,'2023-11-02','Lote456',800,150,'2025-01-01'),(11003,805,205,'2023-11-03','Lote789',1200,200,'2023-12-01'),(11004,804,204,'2023-11-04','LoteABC',300,50,'2025-11-10'),(11005,802,202,'2023-11-05','LoteXYZ',100,30,'2024-11-01');
/*!40000 ALTER TABLE `pedidofornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `itensPedido_id` int DEFAULT NULL,
  `vendedor_id` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendedor_id_pedidos_idx` (`vendedor_id`),
  KEY `fk_itensPedido_id_pedidos_idx` (`itensPedido_id`),
  CONSTRAINT `fk_itensPedido_id_pedidos` FOREIGN KEY (`itensPedido_id`) REFERENCES `itenspedido` (`id`),
  CONSTRAINT `fk_vendedor_id_pedidos` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (501,523,604,111,'2023-11-01','Em andamento',150),(502,423,603,222,'2023-11-02','Concluído',80),(503,323,605,333,'2023-11-03','Em andamento',300),(504,223,601,444,'2023-11-04','Concluído',200),(505,123,602,555,'2023-11-05','Em andamento',50);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id` int NOT NULL,
  `lote_id` int DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `cod_barras` bigint DEFAULT NULL,
  `fabricante` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lote_id_produto_idx` (`lote_id`),
  CONSTRAINT `fk_lote_id_produto` FOREIGN KEY (`lote_id`) REFERENCES `pedidofornecedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (201,11005,'Paracetamol 500mg','Analgésico e antitérmico.','Medicamento',1234567890123,'Fabricante 1',10.00),(202,11004,'Amoxicilina 500mg','Antibiótico de amplo espectro.','Medicamento',9876543210987,'Fabricante 2',20.00),(203,11003,'Dipirona 50mg/ml','Analgésico e antitérmico em gotas.','Medicamento',3456789012345,'Fabricante 3',4.00),(204,11002,'Curativo Estéril 10x10cm','Pacote com 10 unidades.','Material Hospitalar',5678901234567,'Fabricante 4',35.00),(205,11001,'Seringa Descartável 5ml','Caixa com 100 unidades.','Material Hospitalar',7890123456789,'Fabricante 5',44.00);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receita`
--

DROP TABLE IF EXISTS `receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receita` (
  `id` int NOT NULL,
  `produto_id` int DEFAULT NULL,
  `vendedor_id` int DEFAULT NULL,
  `crm` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendedor_id_receita_idx` (`vendedor_id`),
  KEY `fk_produto_id_receita_idx` (`produto_id`),
  CONSTRAINT `fk_produto_id_receita` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`),
  CONSTRAINT `fk_vendedor_id_receita` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receita`
--

LOCK TABLES `receita` WRITE;
/*!40000 ALTER TABLE `receita` DISABLE KEYS */;
INSERT INTO `receita` VALUES (1101,204,111,'CRM123','2023-11-01'),(1102,203,222,'CRM456','2023-11-02'),(1103,205,333,'CRM789','2023-11-03'),(1104,201,444,'CRMABC','2023-11-04'),(1105,202,555,'CRMXYZ','2023-11-05');
/*!40000 ALTER TABLE `receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `senhacliente`
--

DROP TABLE IF EXISTS `senhacliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `senhacliente` (
  `id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_id_senha_cliente_idx` (`cliente_id`),
  CONSTRAINT `fk_cliente_id_senha_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `senhacliente`
--

LOCK TABLES `senhacliente` WRITE;
/*!40000 ALTER TABLE `senhacliente` DISABLE KEYS */;
INSERT INTO `senhacliente` VALUES (701,523,'senhaJoao123'),(702,423,'senhaMaria456'),(703,323,'senhaPedro789'),(704,223,'senhaAnaLima'),(705,123,'senhaCarlosRocha');
/*!40000 ALTER TABLE `senhacliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `senhavendedor`
--

DROP TABLE IF EXISTS `senhavendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `senhavendedor` (
  `id` int NOT NULL,
  `vendedor_id` int DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendedor_id_senha_vendedor_idx` (`vendedor_id`),
  CONSTRAINT `fk_vendedor_id_senha_vendedor` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `senhavendedor`
--

LOCK TABLES `senhavendedor` WRITE;
/*!40000 ALTER TABLE `senhavendedor` DISABLE KEYS */;
INSERT INTO `senhavendedor` VALUES (901,111,'senhaJoao123'),(902,222,'senhaMaria456'),(903,333,'senhaPedro789'),(904,444,'senhaAnaLima'),(905,555,'senhaCarlosRocha');
/*!40000 ALTER TABLE `senhavendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id` int NOT NULL,
  `produto_id` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `entrega_id` int DEFAULT NULL,
  `vendedor_id` int DEFAULT NULL,
  `pagamento_id` int DEFAULT NULL,
  `data_hora` date DEFAULT NULL,
  `delivered` tinyint(1) DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `valor_total` varchar(45) DEFAULT NULL,
  `plataforma` varchar(45) DEFAULT NULL,
  `farmacia_id` int DEFAULT NULL,
  `entregador_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_id_idx` (`cliente_id`),
  KEY `fk_pagamento_id_venda_idx` (`pagamento_id`),
  KEY `fk_vendedor_id_venda_idx` (`vendedor_id`),
  KEY `fk_entrega_id_venda_idx` (`entrega_id`),
  KEY `fk_produto_id_venda_idx` (`produto_id`),
  KEY `fk_estado_id_venda_idx` (`estado_id`),
  KEY `fk_farmacia_id_venda_idx` (`farmacia_id`),
  KEY `fk_vendedor_id_idx` (`entregador_id`),
  CONSTRAINT `fk_cliente_id_venda` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_entrega_id_venda` FOREIGN KEY (`entrega_id`) REFERENCES `entrega` (`id`),
  CONSTRAINT `fk_estado_id_venda` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`),
  CONSTRAINT `fk_farmacia_id_venda` FOREIGN KEY (`farmacia_id`) REFERENCES `farmacia` (`id`),
  CONSTRAINT `fk_pagamento_id_venda` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`id`),
  CONSTRAINT `fk_produto_id_venda` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`),
  CONSTRAINT `fk_vendedor_id` FOREIGN KEY (`entregador_id`) REFERENCES `entregador` (`id`),
  CONSTRAINT `fk_vendedor_id_venda` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (2001,201,1,523,3001,111,1201,'2023-11-14',1,178,'50','loja',100100,199),(2002,202,2,423,3002,222,1202,'2023-11-14',0,278,'55','aplicativo',200200,299),(2003,203,3,323,3003,333,1203,'2023-11-25',1,278,'100','aplicativo',300300,399),(2004,204,4,223,3004,444,1204,'2023-11-14',0,478,'12','portal',400400,499),(2005,205,5,123,3005,555,1205,'2023-11-14',1,578,'27','portal',500500,599),(2006,202,NULL,223,3004,222,1205,'2023-10-14',1,378,'60','portal',NULL,NULL);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `id` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `salario` double DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (111,'Lucia Pereira','333.111.555-01',28,3500.5,'Feminino','111-222-3333','lucia@email.com'),(222,'Fernando Oliveira','444.222.666-02',35,4000.75,'Masculino','444-555-6666','fernando@email.com'),(333,'Silvia Souza','555.333.777-03',30,3800,'Feminino','777-888-9999','silvia@email.com'),(444,'Roberto Santos','666.444.888-04',45,4500.25,'Masculino','999-000-1111','roberto@email.com'),(555,'Eduarda Lima','777.555.999-05',32,4200.8,'Feminino','222-333-4444','eduarda@email.com');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-26 23:34:12
