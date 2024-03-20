SELECT
    MES,
    sigla_uf,
    
    -- Como está distribuído o contingente na força de trabalho durante a pandemia?
    SUM(IF(c001 = '1', 1, 0)) AS trabalhando,
    SUM(IF(c001 = '2', 1, 0)) AS nao_trabalhando,
    SUM(IF(c001 IS NULL, 1, 0)) AS ignorado_trabalhando,    
    -- Quantos domicílios tiveram que solicitar empréstimos durante a pandemia e quais foram as principais fontes desses empréstimos?
    SUM(IF(e001 = '1', 1, 0)) AS emprestimos_conseguidos,
    SUM(IF(e0021 = '1', 1, 0)) AS emprestimo_banco,
    SUM(IF(e0022 = '1', 1, 0)) AS emprestimo_parente_amigo,
    SUM(IF(e0023 = '1', 1, 0)) AS emprestimo_empregador,    
    -- Quais são as condições de moradia da população durante a pandemia, incluindo propriedade do domicílio e valor do aluguel?
    SUM(IF(f001 = '1', 1, 0)) AS domicilios_proprios_pagos,
    SUM(IF(f001 = '2', 1, 0)) AS domicilios_proprios_financiados,
    SUM(IF(f001 = '3', 1, 0)) AS domicilios_alugados,
    SUM(IF(f001 = '4', 1, 0)) AS domicilios_cedido_empregador,
    SUM(IF(f001 = '5', 1, 0)) AS domicilios_cedido_familiar,
    SUM(IF(f001 = '6', 1, 0)) AS domicilios_cedido_outra_forma,
    AVG(IF(f001 = '3', F0021, NULL)) AS media_valor_aluguel,    
    -- Como a pandemia impactou os rendimentos provenientes de outras fontes além do trabalho?
    SUM(IF(d0011 = '1', 1, 0)) AS recebeu_aposentadoria,
    SUM(IF(d0021 = '1', 1, 0)) AS recebeu_pensao_alimenticia,
    SUM(IF(d0031 = '1', 1, 0)) AS recebeu_bolsa_familia,
    SUM(IF(d0041 = '1', 1, 0)) AS recebeu_beneficio_assistencial,
    SUM(IF(d0051 = '1', 1, 0)) AS recebeu_auxilios_corona,
    SUM(IF(d0061 = '1', 1, 0)) AS recebeu_seguro_desemprego_defeso,
    SUM(IF(d0071 = '1', 1, 0)) AS recebeu_outros,    
    -- Qual é a distribuição de renda entre os trabalhadores durante a pandemia?
    AVG(IF(d0011 = '1', d0013, NULL)) AS media_renda_aposentadoria,
    AVG(IF(d0021 = '1', d0023, NULL)) AS media_renda_pensao_alimenticia,
    AVG(IF(d0031 = '1', d0033, NULL)) AS media_renda_bolsa_familia,
    AVG(IF(d0041 = '1', d0043, NULL)) AS media_renda_beneficio_assistencial,
    AVG(IF(d0051 = '1', d0053, NULL)) AS media_renda_auxilios_corona,
    AVG(IF(d0061 = '1', d0063, NULL)) AS media_renda_seguro_desemprego_defeso,
    AVG(IF(d0071 = '1', d0073, NULL)) AS media_renda_outros
FROM
    `techchalengecovid19.Microdados.tb_pinad_covid`
GROUP BY
    MES, sigla_uf
ORDER BY 
    1, 2;