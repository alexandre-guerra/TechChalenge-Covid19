SELECT
    MES,
    sigla_uf,
    SUM(IF(b011 = '1', 1, 0)) AS qtd_sem_restricao,
    SUM(IF(b011 = '2', 1, 0)) AS qtd_reduziu_contato_mas_saiu,
    SUM(IF(b011 = '3', 1, 0)) AS qtd_ficou_em_casa_necessidade,
    SUM(IF(b011 = '4', 1, 0)) AS qtd_ficou_totalmente_em_casa,    
    -- Qual porcentagem da população adotou trabalho remoto durante a pandemia?
    SUM(IF(c013 = '1', 1, 0)) AS qtd_trabalho_remoto,    
    -- Quantas pessoas estavam afastadas do trabalho devido à quarentena ou isolamento?
    SUM(IF(c003 = '1', 1, 0)) AS qtd_afastadas_quarentena,    
    -- Qual foi o impacto da pandemia na busca por trabalho?
    SUM(IF(c015 = '1', 1, 0)) AS qtd_tomou_providencias_trabalho,
    SUM(IF(c015 = '2', 1, 0)) AS qtd_nao_tomou_providencias_trabalho,    
    -- Quais foram os principais motivos para as pessoas não procurarem trabalho durante a pandemia?
    SUM(IF(c016 = '1', 1, 0)) AS qtd_motivo_pandemia,
    SUM(IF(c016 = '2', 1, 0)) AS qtd_motivo_saude,
    SUM(IF(c016 = '4', 1, 0)) AS qtd_motivo_nao_quer,
    SUM(IF(c016 = '5', 1, 0)) AS qtd_motivo_sem_qualificacao,
    SUM(IF(c016 = '6', 1, 0)) AS qtd_motivo_idade,
    SUM(IF(c016 = '7', 1, 0)) AS qtd_motivo_sem_trabalho_localidade,
    SUM(IF(c016 = '8', 1, 0)) AS qtd_motivo_cuidados_domesticos,
    SUM(IF(c016 = '9', 1, 0)) AS qtd_motivo_aguardando_resposta
FROM
    `techchalengecovid19.Microdados.tb_pinad_covid`
GROUP BY
    MES, sigla_uf
ORDER BY
    1, 2;