INSERT INTO compra."tbBanco"  ("nmBanco", "dsUrlLogo", "cdFebraban")
VALUES ('Banese', NULL, 491);
INSERT INTO compra."tbBanco"  ("nmBanco", "dsUrlLogo", "cdFebraban")
VALUES ('Banco do Brasil', NULL, 1);

INSERT INTO compra."tbCategoria" ("nmCategoria") VALUES ('Eletrônicos');

INSERT INTO compra."tbOperadoraCartao" ("nmOperadora") VALUES ('MasterCard');
INSERT INTO compra."tbOperadoraCartao" ("nmOperadora") VALUES ('Visa');

INSERT INTO compra."tbParceiro" ("nmFantasia", "nrCnpj", "dsUrlSite", "dsEnderecoCompleto")
VALUES ('DATAPEL', 10446469000102, 'http://www.datapel.com.br/', 'Rua Tal, nº tal, Bairro Tal, Aracaju/SE');

INSERT INTO compra."tbProduto" ("dsProduto", "nmProduto")
VALUES ('Macbook Air 13"", 128 GB HD SSD, 4 GB RAM, Mac OS X Lion', 'Macbook Air 13"""');

INSERT INTO compra."tbTelefoneContato" ("nrDdi", "nrDdd", "nrTelefone")
VALUES (55,79,88880000);

INSERT INTO compra."tbUsuario" ("nmUsuario", "dsEmail", "dsSenha", "stUsuario", "tpUsuario")
VALUES ('Administrador', 'admin@admin.com', '123456', 1, 1);
INSERT INTO compra."tbUsuario" ("nmUsuario", "dsEmail", "dsSenha", "stUsuario", "tpUsuario")
VALUES ('Cliente01', 'cliente@zeroum.com', '123456', 0, 0);

INSERT INTO compra."tbContrato" ("dtInicioContrato", "vlPercentualLucro", "cdParceiro" )
VALUES ('2011-06-01', 0.5, 1);

INSERT INTO compra."tbOferta" ("nmOferta", "dsTexto", "vlMercado", "vlDesconto", 
"stOferta", "cdContrato", "cdCategoria")
VALUES ('Macbook incrível a 70%!', 'Lorem ipsur bacon', 3500.00, 2450.00, 
1,1,1);

INSERT INTO compra."tbOfertaProduto" ("cdOferta", "cdProduto") VALUES (1,1);

INSERT INTO compra."tbParceiroTelefoneContato" ("cdParceiro", "cdTelefone") VALUES (1,1);

INSERT INTO compra."tbParceiroUsuarioResponsavel" ("cdParceiro", "cdUsuario") VALUES (1,1);

INSERT INTO compra."tbPagamento"  VALUES (1,1,1);

INSERT INTO compra."tbPagamentoCartao"  ("cdPagamento", "nmTitularCartao", "nrCartao", "cdSeguranca", "dtVencimento")
VALUES (1,'ERICK MENDONCA', '4123135454', '451', '2013-01-01');

INSERT INTO compra."tbCupom"  ("cdOferta", "cdUsuario", "nrCupom", "dtValidade", "stCupom", "cdPagamento")
VALUES (1,2,400,'2011-12-01', 0,1);

INSERT INTO compra."tbCliente" ("nrCpf", "nmCliente", "cdUsuario")
VALUES (70020896760, 'Ariosvaldo Santana', 2);