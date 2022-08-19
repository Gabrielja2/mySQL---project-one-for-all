SELECT COUNT(hi.id__cancao) `quantidade_musicas_no_historico`
FROM SpotifyClone.historico_reproducoes AS hi
	WHERE hi.id__usuario = 1;

-- SELECT COUNT(hi.id__cancao) `quantidade_musicas_no_historico`
-- FROM SpotifyClone.historico_reproducoes AS hi
-- 	JOIN SpotifyClone.usuario AS us
--   ON hi.id__usuario = us.id__usuario
-- WHERE us.nome__usuario = 'Barbara Liskov';