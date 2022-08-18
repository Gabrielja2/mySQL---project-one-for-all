SELECT
us.nome__usuario AS `usuario`,
COUNT(re.id_reproducao) as `qt_de_musicas_ouvidas`,
ROUND(SUM(ca.duracao_cancao_in_seconds) / 60, 2) AS `total_minutos` 
FROM SpotifyClone.usuario AS us 
  JOIN SpotifyClone.historico_reproducoes AS re
	ON us.id__usuario = re.id__usuario
	JOIN SpotifyClone.cancao AS ca
	ON re.id__cancao = ca.id__cancao
GROUP BY us.nome__usuario
ORDER BY us.nome__usuario;
