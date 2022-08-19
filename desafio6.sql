SELECT
MIN(pl.valor__plano) `faturamento_minimo`,
MAX(pl.valor__plano) `faturamento_maximo`,
ROUND(AVG(pl.valor__plano), 2) `faturamento_medio`,
ROUND(SUM(pl.valor__plano), 2) AS `faturamento_total`
FROM SpotifyClone.plano AS pl
	JOIN SpotifyClone.usuario AS us
	ON pl.id__plano = us.id__plano;