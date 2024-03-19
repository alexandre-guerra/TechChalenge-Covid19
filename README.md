# Tech Challenge - Pós-Graduação em Data Analytics

**Instituição:** FIAP - Turma 2DTAT

---

## POSTECH FIAP - Fase 3 - BIG DATA

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

- [**MapeamentoDicionario.xlsx**](https://github.com/seuUsuario/seuRepositorio/blob/main/MapeamentoDicionario.xlsx)

#### 3F. Importação dos dados para o BigQuery do Google Cloud

- **SelecaoDados.sql**
- **vw_caracteristicas_populacao_entrevistada.sql**
- **vw_caracterizacao_sintomas_populacao.sql**
- **vw_comportamento_populacao_epoca_covid.sql**
- **vw_características_economicas_sociedade.sql**

#### 3G. Integração dos dados ao Microsoft Power BI

- **Modelo de dados**

#### 3H. Análise aprofundada e multifacetada dos impactos da COVID-19

### 4. Resultados e Aplicações

### 5. Conclusão

### 6. Ações Recomendadas
