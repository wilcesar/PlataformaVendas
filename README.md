### Emulador de sistema de compras :shopping_cart:
<p>Emulador de uma plataforma para vendas em Delphi</p>
<h4> 
	Projeto finalizado!:ok:
</h4>
SQL par criação do banco de dados e tabelas MySQL :zap:

```sql
CREATE DATABASE PlataformaVendas;

USE PlataformaVendas;

CREATE TABLE produtos (
  id INT(11) NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(50) NOT NULL,
  Descricao VARCHAR(200) DEFAULT NULL,
  CustoCompra DOUBLE DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE cesta (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  DataCompra DATE NOT NULL,
  ValorTotal DOUBLE NOT NULL,
  PRIMARY KEY (ID)
); 

CREATE TABLE cesta_itens (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  cesta_ID INT(11) NOT NULL,
  produto_ID INT(11) NOT NULL,
  quantidade DOUBLE DEFAULT NULL,
  valorTotal DOUBLE DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY CESTAITENSPRODUTO (produto_ID),
  KEY CESTAITENSCESTA (cesta_ID),
  CONSTRAINT CESTAITENSCESTA FOREIGN KEY (cesta_ID) REFERENCES cesta (ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT CESTAITENSPRODUTO FOREIGN KEY (produto_ID) REFERENCES produtos (id) ON DELETE CASCADE ON UPDATE CASCADE
);
```
