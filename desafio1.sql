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
  valor__plano INT NOT NULL 
);

CREATE TABLE artista (
  id__artista INT PRIMARY KEY AUTO_INCREMENT,
  nome__artista VARCHAR(45) NOT NULL 
);

CREATE TABLE usuario (
  id__usuario INT PRIMARY KEY AUTO_INCREMENT,
  nome__usuario VARCHAR(45) NOT NULL,
  idade__usuario INT NOT NULL,
  id__plano INT NOT NULL,
  FOREIGN KEY (id__plano) REFERENCES plano(id__plano)
);

CREATE TABLE seguindo_artista (
  id__usuario INT NOT NULL,  
  id__artista INT NOT NULL,
  CONSTRAINT PRIMARY KEY(id__usuario, id__artista),
  FOREIGN KEY (id__usuario) REFERENCES usuario(id__usuario),
  FOREIGN KEY (id__artista) REFERENCES artista(id__artista)
);

CREATE TABLE album (
  id__album INT PRIMARY KEY AUTO_INCREMENT,
  nome__album VARCHAR(100) NOT NULL,
  id__artista INT NOT NULL,
  ano__lancamento INT NOT NULL,
  FOREIGN KEY (id__artista) REFERENCES artista(id__artista)
);

CREATE TABLE cancao (
  id__cancao INT PRIMARY KEY AUTO_INCREMENT,
  nome__cancao VARCHAR(100) NOT NULL,
  duracao_cancao_in_econds INT NOT NULL,
  id__album INT NOT NULL,
  FOREIGN KEY (id__album) REFERENCES album(id__album)
);

CREATE TABLE historico_reproducoes (
  id__usuario INT NOT NULL,  
  id__cancao INT NOT NULL,
  data__reproducao DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY(id__usuario, id__cancao),
  FOREIGN KEY (id__usuario) REFERENCES usuario(id__usuario),
  FOREIGN KEY (id__cancao) REFERENCES cancao(id__cancao)
);