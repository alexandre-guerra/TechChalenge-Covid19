SELECT
    MES,
    sigla_uf,
    COUNT(*) AS qtd_populacao_entrevistada,
    SUM(IF(A003 = '1', 1, 0)) AS qtd_homens,
    SUM(IF(A003 = '2', 1, 0)) AS qtd_mulheres,
    SUM(IF(A004 = '1', 1, 0)) AS qtd_branca,
    SUM(IF(A004 = '2', 1, 0)) AS qtd_preta,
    SUM(IF(A004 = '3', 1, 0)) AS qtd_amarela,
    SUM(IF(A004 = '4', 1, 0)) AS qtd_parda,
    SUM(IF(A004 = '5', 1, 0)) AS qtd_indigena,
    SUM(IF(A004 = '9', 1, 0)) AS qtd_ignorado,
    SUM(IF(A005 = '1', 1, 0)) AS qtd_sem_instrucao,
    SUM(IF(A005 BETWEEN '2' AND '3', 1, 0)) AS qtd_fundamental,
    SUM(IF(A005 BETWEEN '4' AND '5', 1, 0)) AS qtd_medio,
    SUM(IF(A005 BETWEEN '6' AND '7', 1, 0)) AS qtd_superior,
    SUM(IF(A005 = '8', 1, 0)) AS qtd_pos_graduacao
FROM
    `techchalengecovid19.Microdados.tb_pinad_covid`
GROUP BY
    MES,
    sigla_uf
ORDER BY
    1, 2;