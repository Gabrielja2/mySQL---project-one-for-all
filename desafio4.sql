SELECT DISTINCT us.nome__usuario  `usuario`,
	IF(MAX(YEAR(re.data__reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo')  `status_usuario`
	FROM SpotifyClone.usuario AS us
	JOIN SpotifyClone.historico_reproducoes AS re
    ON us.id__usuario = re.id__usuario
GROUP BY us.nome__usuario
ORDER BY us.nome__usuario;