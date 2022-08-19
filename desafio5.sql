SELECT ca.nome__cancao `cancao`, COUNT(re.id__cancao) `reproducoes`
FROM SpotifyClone.cancao AS ca
	JOIN SpotifyClone.historico_reproducoes AS re
	ON ca.id__cancao = re.id__cancao
GROUP BY ca.nome__cancao
ORDER BY reproducoes DESC, ca.nome__cancao LIMIT 2;