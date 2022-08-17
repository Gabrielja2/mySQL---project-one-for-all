SELECT 
(SELECT COUNT(nome__cancao) FROM SpotifyClone.cancao) AS `cancoes`,
(SELECT COUNT(nome__artista) FROM SpotifyClone.artista) AS `artistas`,
(SELECT COUNT(nome__album) FROM SpotifyClone.album) AS `albuns`;