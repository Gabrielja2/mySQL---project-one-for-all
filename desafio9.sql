SELECT COUNT(hi.id__cancao) `quantidade_musicas_no_historico`
FROM SpotifyClone.historico_reproducoes AS hi
	WHERE hi.id__usuario = 1;