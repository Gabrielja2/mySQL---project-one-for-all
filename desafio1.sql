-- DROP DATABASE IF EXISTS SpotifyClone;

--   CREATE DATABASE IF NOT EXISTS SpotifyClone;

--   CREATE TABLE SpotifyClone.tabela1(
--       coluna1 tipo restricoes,
--       coluna2 tipo restricoes,
--       colunaN tipo restricoes,
--   ) engine = InnoDB;

--   CREATE TABLE SpotifyClone.tabela2(
--       coluna1 tipo restricoes,
--       coluna2 tipo restricoes,
--       colunaN tipo restricoes,
--   ) engine = InnoDB;

--   INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
--   VALUES
--     ('exemplo de dados 1', 'exemplo de dados A'),
--     ('exemplo de dados 2', 'exemplo de dados B'),
--     ('exemplo de dados 3', 'exemplo de dados C');

--   INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
--   VALUES
--     ('exemplo de dados 1', 'exemplo de dados X'),
--     ('exemplo de dados 2', 'exemplo de dados Y');

DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano (
  id__plano INT PRIMARY KEY AUTO_INCREMENT,
  nome__plano VARCHAR(45) NOT NULL,
  valor__plano DECIMAL NOT NULL 
);

INSERT INTO SpotifyClone.plano (id__plano, nome__plano, valor__plano)
VALUES
  (1, 'gratuito', 0),
  (2, 'familiar', 7.99),
  (3, 'universitario', 5.99),
  (4, 'pessoal', 6.99);

CREATE TABLE artista (
  id__artista INT PRIMARY KEY AUTO_INCREMENT,
  nome__artista VARCHAR(45) NOT NULL 
);

INSERT INTO SpotifyClone.artista (id__artista, nome__artista)
VALUES
  (1, 'Beyoncé'),
  (2, 'Queen'),
  (3, 'Elis Regina'),
  (4, 'Baco Exu do Blues'),
  (5, 'Blind Guardian'),
  (6, 'Nina Simone');

CREATE TABLE usuario (
  id__usuario INT PRIMARY KEY AUTO_INCREMENT,
  nome__usuario VARCHAR(45) NOT NULL,
  idade__usuario INT NOT NULL,
  id__plano INT NOT NULL,
  FOREIGN KEY (id__plano) REFERENCES plano(id__plano)
);

INSERT INTO SpotifyClone.usuario (id__usuario, nome__usuario, idade__usuario, id__plano)
VALUES
  (1, 'Barbara Liskov', 82, 1),
  (2, 'Robert Cecil Martin', 58, 1),
  (3, 'Ada LovelaceAda Lovelace', 37, 2),
  (4, 'Martin Fowler', 46, 2),
  (5, 'Sandi Metz', 58, 2),
  (6, 'Paulo Freire', 19, 3),
  (7, 'Bell Hooks', 26, 3),
  (8, 'Christopher Alexander', 85, 4),
  (9, 'Judith Butler', 45, 4),
  (10, 'Jorge Amado', 58, 4);

CREATE TABLE seguindo_artista (
  id__usuario INT NOT NULL,  
  id__artista INT NOT NULL,
  CONSTRAINT PRIMARY KEY(id__usuario, id__artista),
  FOREIGN KEY (id__usuario) REFERENCES usuario(id__usuario),
  FOREIGN KEY (id__artista) REFERENCES artista(id__artista)
);

INSERT INTO SpotifyClone.seguindo_artista (id__usuario, id__artista)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 1),
  (6, 6),
  (7, 6),
  (8, 0),
  (9, 3),
  (10, 2);

CREATE TABLE album (
  id__album INT PRIMARY KEY AUTO_INCREMENT,
  nome__album VARCHAR(100) NOT NULL,
  id__artista INT NOT NULL,
  ano__lancamento INT NOT NULL,
  FOREIGN KEY (id__artista) REFERENCES artista(id__artista)
);

INSERT INTO SpotifyClone.album (id__album, nome__album, id__artista, ano__lancamento)
VALUES
  (1, 'Renaissance', 1, 2022),
  (2, 'Jazz', 2, 1978),
  (3, 'Hot Space', 2, 1982),
  (4, 'Falso Brilhante', 3, 1998),
  (5, 'Vento de Maio', 3, 2001),
  (6, 'QVVJFA?', 4, 2003),
  (7, 'Somewhere Far Beyond', 5, 2007),
  (8, 'I Put A Spell On You', 6, 2012);

CREATE TABLE cancao (
  id__cancao INT PRIMARY KEY AUTO_INCREMENT,
  nome__cancao VARCHAR(100) NOT NULL,
  duracao_cancao_in_seconds INT NOT NULL,
  id__album INT NOT NULL,
  FOREIGN KEY (id__album) REFERENCES album(id__album)
);

INSERT INTO SpotifyClone.cancao (id__cancao, nome__cancao, duracao_cancao_in_seconds, id__album)
VALUES
  (1, 'BREAK MY SOUL', 279, 1),
  (2, 'VIRGO’S GROOVE', 369, 1),
  (3, 'ALIEN SUPERSTAR', 116, 1),
  (4, 'Don’t Stop Me Now', 203, 2),
  (5, 'Under Pressure', 152, 3),
  (6, 'Como Nossos Pais', 105, 4),
  (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
  (8, 'Samba em Paris', 267, 6),
  (9, 'The Bard’s Song', 244, 7),
  (10, 'Feeling Good', 100, 8);

CREATE TABLE historico_reproducoes (
  id__usuario INT NOT NULL,  
  id__cancao INT NOT NULL,
  data__reproducao DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY(id__usuario, id__cancao),
  FOREIGN KEY (id__usuario) REFERENCES usuario(id__usuario),
  FOREIGN KEY (id__cancao) REFERENCES cancao(id__cancao)
);

INSERT INTO SpotifyClone.historico_reproducoes (id__usuario, id__cancao, data__reproducao)
VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'), 
  (16, 3, '2015-12-13 08:30:22');