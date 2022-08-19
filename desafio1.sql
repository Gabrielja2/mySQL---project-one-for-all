DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano (
  id__plano INT PRIMARY KEY AUTO_INCREMENT,
  nome__plano VARCHAR(45) NOT NULL,
  valor__plano DECIMAL(10, 2) NOT NULL 
) engine = InnoDB;

CREATE TABLE artista (
  id__artista INT PRIMARY KEY AUTO_INCREMENT,
  nome__artista VARCHAR(45) NOT NULL 
) engine = InnoDB;

CREATE TABLE usuario (
  id__usuario INT PRIMARY KEY AUTO_INCREMENT,
  nome__usuario VARCHAR(45) NOT NULL,
  idade__usuario INT NOT NULL,
  id__plano INT NOT NULL,
  data__assinatura DATE NOT NULL,
  FOREIGN KEY (id__plano) REFERENCES plano(id__plano)
) engine = InnoDB;

CREATE TABLE album (
  id__album INT PRIMARY KEY AUTO_INCREMENT,
  nome__album VARCHAR(100) NOT NULL,
  id__artista INT NOT NULL,
  ano__lancamento INT NOT NULL,
  FOREIGN KEY (id__artista) REFERENCES artista(id__artista)
) engine = InnoDB;

CREATE TABLE cancao (
  id__cancao INT PRIMARY KEY AUTO_INCREMENT,
  nome__cancao VARCHAR(100) NOT NULL,
  duracao_cancao_in_seconds INT NOT NULL,
  id__artista INT NOT NULL,
  id__album INT NOT NULL,
  FOREIGN KEY (id__artista) REFERENCES artista(id__artista),
  FOREIGN KEY (id__album) REFERENCES album(id__album)
) engine = InnoDB;

CREATE TABLE seguindo_artista (
  id__seguido INT AUTO_INCREMENT,
  id__usuario INT NOT NULL,  
  id__artista INT NOT NULL,
  CONSTRAINT PRIMARY KEY(id__seguido, id__usuario, id__artista),
  FOREIGN KEY (id__usuario) REFERENCES usuario(id__usuario),
  FOREIGN KEY (id__artista) REFERENCES artista(id__artista)
) engine = InnoDB;

CREATE TABLE historico_reproducoes (
  id_reproducao INT AUTO_INCREMENT,
  id__usuario INT NOT NULL,  
  id__cancao INT NOT NULL,
  data__reproducao DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY(id_reproducao, id__usuario, id__cancao),
  FOREIGN KEY (id__usuario) REFERENCES usuario(id__usuario),
  FOREIGN KEY (id__cancao) REFERENCES cancao(id__cancao)
) engine = InnoDB;

INSERT INTO SpotifyClone.plano (nome__plano, valor__plano)
  VALUES
    ('gratuito', 0.00),
    ('universitario', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

INSERT INTO SpotifyClone.artista (nome__artista)
  VALUES
    ('Beyoncé'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone'),
    ('Queen');

INSERT INTO SpotifyClone.usuario (nome__usuario, idade__usuario, id__plano, data__assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 4, '2017-12-30'),
    ('Martin Fowler', 46, 4, '2017-01-17'),
    ('Sandi Metz', 58, 4, '2018-04-29'),
    ('Paulo Freire', 19, 2, '2018-02-14'),
    ('Bell Hooks', 26, 2, '2018-01-05'),
    ('Christopher Alexander', 85, 3, '2019-06-05'),
    ('Judith Butler', 45, 3, '2020-05-13'),
    ('Jorge Amado', 58, 3, '2017-02-17');


INSERT INTO SpotifyClone.album (nome__album, id__artista, ano__lancamento)
  VALUES
    ('Renaissance', 1, 2022),
    ('Jazz', 6, 1978),
    ('Hot Space', 6, 1982),
    ('Falso Brilhante', 2, 1998),
    ('Vento de Maio', 2, 2001),
    ('QVVJFA?', 3, 2003),
    ('Somewhere Far Beyond', 4, 2007),
    ('I Put A Spell On You', 5, 2012);

INSERT INTO SpotifyClone.cancao (nome__cancao, duracao_cancao_in_seconds, id__album, id__artista)
  VALUES
    ('BREAK MY SOUL', 279, 1, 1),
    ('VIRGO’S GROOVE', 369, 1, 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ('Don’t Stop Me Now', 203, 2, 6),
    ('Under Pressure', 152, 3, 6),
    ('Como Nossos Pais', 105, 4, 2),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5, 2),
    ('Samba em Paris', 267, 6, 3),
    ('The Bard’s Song', 244, 7, 4),
    ('Feeling Good', 100, 8, 5);

INSERT INTO SpotifyClone.seguindo_artista (id__usuario, id__artista)
  VALUES
    (1, 1),
    (1, 6),
    (1, 2),
    (2, 1),
    (2, 2),
    (3, 6),
    (4, 3),
    (5, 4),
    (5, 5),
    (6, 5),
    (6, 1),
    (7, 5),
    (9, 2),
    (10, 6);    

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
    (10, 3, '2015-12-13 08:30:22');