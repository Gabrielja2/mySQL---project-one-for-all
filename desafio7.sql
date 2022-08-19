SELECT
ar.nome__artista `artista`,
al.nome__album `album`,
COUNT(se.id__artista) `seguidores`
FROM SpotifyClone.artista AS ar
	JOIN SpotifyClone.album AS al
    ON ar.id__artista = al.id__artista
    JOIN SpotifyClone.seguindo_artista AS se
    ON ar.id__artista = se.id__artista
GROUP BY ar.nome__artista, al.nome__album
ORDER BY seguidores DESC, artista, album;