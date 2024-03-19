SELECT
    MES,
    sigla_uf,
    -- Sintomas mais comuns
    SUM(IF(b0011 = '1', 1, 0)) AS qtd_febre,
    SUM(IF(b0012 = '1', 1, 0)) AS qtd_tosse,
    SUM(IF(b0013 = '1', 1, 0)) AS qtd_dor_de_garganta,
    SUM(IF(b0014 = '1', 1, 0)) AS qtd_dificuldade_para_respirar,
    SUM(IF(b0015 = '1', 1, 0)) AS qtd_dor_de_cabeca,
    SUM(IF(b0016 = '1', 1, 0)) AS qtd_dor_no_peito,
    SUM(IF(b0017 = '1', 1, 0)) AS qtd_nausea_ou_enjoo,
    SUM(IF(b0018 = '1', 1, 0)) AS qtd_nariz_entupido,
    SUM(IF(b0019 = '1', 1, 0)) AS qtd_fadiga,
    SUM(IF(b00110 = '1', 1, 0)) AS qtd_dor_nos_olhos,
    SUM(IF(b00111 = '1', 1, 0)) AS qtd_perda_de_olfato_ou_paladar,
    SUM(IF(b00112 = '1', 1, 0)) AS qtd_dor_muscular,
    SUM(IF(b00113 = '1', 1, 0)) AS qtd_diarreia,
    -- Medidas tomadas para se recuperar dos sintomas
    SUM(IF(b0031 = '1', 1, 0)) AS qtd_ficou_em_casa,
    SUM(IF(b0032 = '1', 1, 0)) AS qtd_ligou_profissional_saude,
    SUM(IF(b0033 = '1', 1, 0)) AS qtd_tomou_remedio_conta_propria,
    SUM(IF(b0034 = '1', 1, 0)) AS qtd_tomou_remedio_orientacao_medica,
    SUM(IF(b0035 = '1', 1, 0)) AS qtd_recebeu_visita_profissional_saude_SUS,
    SUM(IF(b0036 = '1', 1, 0)) AS qtd_recebeu_visita_profissional_saude_particular,
    -- Assistência médica devido a sintomas    
    SUM(IF(b002 = '1', 1, 0)) AS qtd_buscou_assistencia,
    -- Tipo de estabelecimento de saúde procurado
    SUM(IF(b0041 = '1', 1, 0)) AS qtd_posto_saude,
    SUM(IF(b0042 = '1', 1, 0)) AS qtd_pronto_socorro_sus,
    SUM(IF(b0043 = '1', 1, 0)) AS qtd_hospital_sus,
    SUM(IF(b0044 = '1', 1, 0)) AS qtd_ambulatorio_consultorio_privado,
    SUM(IF(b0045 = '1', 1, 0)) AS qtd_pronto_socorro_privado,
    SUM(IF(b0046 = '1', 1, 0)) AS qtd_hospital_socorro,
    -- Plano de saúde
    SUM(IF(b007 = '1', 1, 0)) AS qtd_com_plano_saude,
    -- Internações
    SUM(IF(b005 = '1', 1, 0)) AS qtd_internacoes,
    -- Intubações
    SUM(IF(b006 = '1', 1, 0)) AS qtd_intubacoes,
    -- Testes realizados e resultados
    SUM(IF(b008 = '1', 1, 0)) AS qtd_fez_teste,
    SUM(IF(b009b = '1' OR b009d = '1' OR b009f = '1', 1, 0)) AS qtd_teste_positivo,
    SUM(IF(b009b = '2' OR b009d = '2' OR b009f = '2', 1, 0)) AS qtd_teste_negativo,
    SUM(IF(b009b = '3' OR b009d = '3' OR b009f = '3', 1, 0)) AS qtd_teste_inconclusivo
FROM
    `techchalengecovid19.Microdados.tb_pinad_covid`
WHERE
    (
    b00110 = '1' OR
    b00111 = '1' OR
    b00112 = '1' OR
    b00113 = '1' OR
    b0011 = '1' OR
    b0012 = '1' OR
    b0013 = '1' OR
    b0014 = '1' OR
    b0015 = '1' OR
    b0016 = '1' OR
    b0017 = '1' OR
    b0018 = '1' OR
    b0019 = '1'
    )
GROUP BY
    MES, sigla_uf
ORDER BY
    1, 2;