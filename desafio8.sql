SELECT ar.nome__artista `artista`, al.nome__album `album`
FROM SpotifyClone.artista AS ar
	JOIN SpotifyClone.album as al
    ON ar.id__artista = al.id__artista
WHERE ar.nome__artista = 'Elis Regina'
ORDER BY album;