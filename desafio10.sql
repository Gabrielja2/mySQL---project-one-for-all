SELECT ca.nome__cancao `nome`, COUNT(hi.id__cancao) `reproducoes`
FROM SpotifyClone.cancao AS ca
	JOIN SpotifyClone.historico_reproducoes AS hi
	ON ca.id__cancao = hi.id__cancao
    JOIN SpotifyClone.usuario AS us
    ON hi.id__usuario = us.id__usuario
    WHERE us.id__plano = 1 OR us.id__plano = 3
GROUP BY ca.nome__cancao
ORDER BY nome;