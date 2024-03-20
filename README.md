# Tech Challenge - Pós-Graduação em Data Analytics

**Instituição:** FIAP - Turma 2DTAT

---

## POSTECH FIAP - Fase 3 - BIG DATA

### Título

**Análise de Impacto da COVID-19 Através dos Dados da PNAD: Estratégias e Preparação Hospitalar para Futuros Surtos**
---

**Objetivo:** Trazer uma breve análise da base de dados PNAD COVID-19 do IBGE, mostrar como foi a organização do banco, as perguntas selecionadas para a resposta do problema e quais seriam as principais ações que o hospital deverá tomar em caso de um novo surto de COVID-19.

---

### 1. Introdução

A base de dados escolhida para esta análise foi a PNAD-COVID-19 do IBGE. Esta base oferece insights valiosos sobre diversos aspectos, incluindo os sintomas clínicos reportados pela população, as mudanças no comportamento social e as condições econômicas enfrentadas pelos indivíduos durante o período mais crítico da pandemia.

Este estudo visa não apenas mapear o impacto passado da COVID-19, mas também equipar o hospital com informações essenciais que possam guiar as estratégias de saúde pública em resposta a futuras crises sanitárias. Portanto, a análise focada nos dados selecionados do questionário PNAD-COVID-19 é uma peça fundamental neste processo, permitindo-nos desenhar um panorama detalhado e fundamentar as decisões baseadas em evidências concretas.

### 2. Base de Dados e Metodologia

Utilização de Banco de dados em nuvem GCP BigQuery. Seleção de questões relevantes da pesquisa, limitando-se ao máximo de 20 questionamentos para manter a análise focada e gerenciável.

### 3. Desenvolvimento da Solução

Após acessar a base de dados PNAD COVID-19 disponibilizada pelo IBGE, selecionei as questões mais pertinentes para abordar os aspectos solicitados.

#### 3A. Caracterização dos sintomas clínicos da população

Identifiquei as variáveis relacionadas a sintomas, atendimento médico e procedimentos de saúde, que fornecerão uma visão detalhada sobre a condição clínica da população durante a pandemia:

- **Questões selecionadas:**
  - B1 (Sintomas de COVID-19 na última semana, incluindo febre, tosse, dor de garganta, etc.)
  - B2 (Busca por estabelecimento de saúde)
  - B3 (Medidas tomadas para recuperação dos sintomas)
  - B4 (Tipo de estabelecimento de saúde procurado)
  - B5 (Internação necessária após procurar estabelecimento de saúde)
  - B6 (Procedimentos realizados durante a internação)
  - B7 (Posse de plano de saúde)
  - B8 (Realização de teste para COVID-19)
  - B9A-B9F (Tipos de teste de COVID-19 realizados e resultados)
  - B10 (Diagnóstico prévio de outras condições médicas)

#### 3B. Comportamento da população durante a COVID-19

Selecionei perguntas focadas no isolamento social, mudanças no trabalho e na busca de emprego para entender como a população se adaptou à nova realidade impostada pela pandemia.

- **Questões selecionadas:**
  - B11 (Medidas de isolamento social adotadas na última semana)
  - C3 (Motivo do afastamento temporário do trabalho)
  - C13 (Trabalho remoto na última semana)
  - C15 (Procura por trabalho na última semana)
  - C16 (Motivo para não procurar trabalho)

#### 3C. Características econômicas da sociedade

Escolhi variáveis que refletem a situação de trabalho, renda e moradia para analisar o impacto econômico da pandemia na sociedade.

- **Questões selecionadas:**
  - C1 (Trabalho ou bico na última semana)
  - C6 (Posse de mais de um trabalho)
  - C7-C7f (Características do emprego principal)
  - D1 (Rendimento de outras fontes no último mês)
  - E1 (Solicitação de empréstimo durante a pandemia)
  - E2 (Fonte do empréstimo adquirido)
  - F1 (Condição de propriedade do domicílio)
  - F2 (Valor do aluguel pago no último mês)

#### 3D. Perguntas específicas para guiar a análise

- **Caracterização dos Sintomas Clínicos da População (Módulo B):**
  - Quais são os sintomas mais comuns de COVID-19 entre a população estudada?
  - Qual porcentagem da população buscou assistência médica devido a sintomas de síndrome gripal ou COVID-19?
  - Quais foram as principais medidas tomadas pelos indivíduos para se recuperar dos sintomas?
  - Em que tipo de estabelecimento de saúde as pessoas buscaram atendimento?
  - Qual porcentagem dos indivíduos que buscaram atendimento foi internada?
  - Entre os internados, quantos foram submetidos a procedimentos como intubação?
  - Qual porcentagem da população possui plano de saúde?
  - Quantas pessoas realizaram teste para COVID-19 e quais foram os resultados?

- **Comportamento da População na Época da COVID-19:**
  - Como a pandemia afetou o comportamento de isolamento social da população?
  - Qual porcentagem da população adotou trabalho remoto durante a pandemia?
  - Quantas pessoas estavam afastadas do trabalho devido à quarentena ou isolamento?
  - Qual foi o impacto da pandemia na busca por trabalho?
  - Quais foram os principais motivos para as pessoas não procurarem trabalho durante a pandemia?

- **Características Econômicas da Sociedade:**
  - Como está distribuído o contingente na força de trabalho durante a pandemia?
  - Qual é a distribuição de renda entre os trabalhadores durante a pandemia?
  - Quantos domicílios tiveram que solicitar empréstimos durante a pandemia e quais foram as principais fontes desses empréstimos?
  - Quais são as condições de moradia da população durante a pandemia, incluindo propriedade do domicílio e valor do aluguel?
  - Como a pandemia impactou os rendimentos provenientes de outras fontes além do trabalho?

#### 3E. Organização dos dados

- [**MapeamentoDicionario.xlsx**](https://github.com/alexandre-guerra/TechChalenge-Covid19/blob/main/MapeamentoDicionario.xlsx)

#### 3F. Importação dos dados para o BigQuery do Google Cloud

- **SelecaoDados.sql:**

```sql
SELECT
    mes, ano, sigla_uf, a003, a004,
    a005, b0011, b00110, b00111, b00112,
    b00113, b0012, b0013, b0014, b0015,
    b0016, b0017, b0018, b0019, b002,
    b0031, b0032, b0033, b0034, b0035,
    b0036, b0037, b0041, b0042, b0043,
    b0044, b0045, b0046, b005, b006,
    b007, b008, b009a, b009b, b009c,
    b009d, b009e, b009f, b0101, b0102,
    b0103, b0104, b0105, b0106, b011,
    c001, c002, c003, c004, c005,
    c006, c007, c007a, c007b, c007c,
    c007d, c007e, c007f, c013, c015,
    c016, d0011, d0021, d0031, d0041,
    d0051, d0061, d0071, e001, e0021,
    e0022, e0023, e0024, f001, f0022,
    F0021, d0013, d0023, d0033, d0043,
    d0053, d0063, d0073
FROM `basedosdados.br_ibge_pnad_covid.microdados`
WHERE ano = 2020
AND mes BETWEEN 5 AND 11;
```
   
- **vw_caracteristicas_populacao_entrevistada.sql:**

```sql
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
```

- **vw_caracterizacao_sintomas_populacao.sql:**

```sql
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
```

- **vw_comportamento_populacao_epoca_covid.sql:**

```sql
SELECT
    MES,
    sigla_uf,
    -- Como a pandemia afetou o comportamento de isolamento social da população?
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
```

- **vw_características_economicas_sociedade.sql:**

```sql
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
```


#### 3G. Integração dos dados ao Microsoft Power BI

- **Modelo de dados:**

![Diagrama De Dados](/ModeloDados.png)

- **Acesso ao Dashboard:**

  

### 4. Resultados e Aplicações

A análise dos dashboards da Pesquisa Nacional por Amostra de Domicílios - PNAD COVID19 revela informações críticas sobre o impacto da pandemia no Brasil entre maio e novembro de 2020. Os dados ilustram uma variedade de sintomas da COVID-19 relatados pela população, com destaque para febre e dor de cabeça como os mais comuns. Além disso, uma parcela significativa da população não procurou assistência médica, o que pode indicar barreiras no acesso à saúde ou subnotificação de casos.

O comportamento de isolamento social mostra que a maioria das pessoas adotou medidas de restrição em algum nível, mas ainda havia uma proporção considerável que não seguiu as recomendações de permanecer em casa. No âmbito econômico, notamos que uma grande parcela da população estava afastada do trabalho, e um número significativo não procurou emprego devido à pandemia, destacando o impacto econômico e social da COVID-19.

Essas informações são cruciais para entender as dinâmicas de saúde, econômicas e sociais durante a pandemia, permitindo que pesquisadores, formuladores de políticas e o público em geral tenham uma visão mais clara dos seus efeitos.

### 5. Conclusão e Ações Recomendadas

**Principais Ações Recomendadas para Hospitais em caso de novo surto de COVID-19:**

- Preparação e Resposta Rápida: Melhorar a capacidade de resposta rápida a surtos, aumentando a disponibilidade de leitos, suprimentos médicos e pessoal treinado.

- Triagem e Testagem: Implementar sistemas eficientes de triagem e testagem para identificar e isolar rapidamente os casos de COVID-19.

- Educação e Comunicação: Fortalecer as campanhas de educação pública sobre medidas de prevenção, sintomas da COVID-19 e quando procurar tratamento médico.

- Suporte à Comunidade: Trabalhar em conjunto com a comunidade para fornecer suporte a pessoas em quarentena e aquelas economicamente impactadas pela pandemia.

- Monitoramento e Análise de Dados: Utilizar dados para monitorar a propagação do vírus, identificar hotspots e informar a tomada de decisão.

Essas ações ajudariam a mitigar o impacto de futuros surtos e garantir que os hospitais e sistemas de saúde estejam melhor preparados para responder eficazmente.
