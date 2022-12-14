# EBAC
### Descrição do case: 

##### Contexto

<p>A empresa fictícia chamada “ConstruBem” tem dados internos oriundos de seus sistemas e deseja descobrir informações estratégicas para aumentar vendas e reter clientes.</p>

<p>Há necessidade de aumentar as vendas dos produtos das categorias XT660, XTZ250 e CB750.</p>

##### Objetivo:

<p>Identificar oportunidade de acelerar vendas e controlar a perda de clientes. Para isso, você vai receber duas bases de dados (potencial por cliente, e Vendas de 2020 a 2022).</p>

##### Desafios importantes:

1.	Prospecção: oportunidades para conquistar novos clientes - Identificar os clientes com maior potencial de compra.
2.	Aumentar Receita em clientes atuais: Identificar oportunidades de vender mais do mesmo produto e de agregar outros produtos.
3.	Perda de clientes: Evitar perda de clientes.

##### Tarefas:

<p>Entender o nível de qualidade e consistência dos dados – campos missings, tipo de dados, etc.</p>

1.	Criar ambiente no Databricks e carregar dados.
2.	Processar dados e fazer resumo de quantidades.
3.	Transferir estruturas finais para um banco SQL e iniciar análises utilizando T-SQL com saídas gráficas em Power Point.
4.	Trazer mais dinamismo para as análises criando um relatório no Power BI Desktop.
5.	Apresentar descobertas insights.

## Day 01
<p>No primeiro dia dessa empreitada estudamos um pouco sobre intorudção e contrução do ambiente Databriks. </p>
<p>O Databricks é uma plataforma de análise baseada no Apache Spark. Projetado com os fundadores do Apache Spark, com o Databricks temos fluxos de trabalho simplificados e um workspace interativo que permite a colaboração entre os cientistas de dados, os engenheiros de dados e os analistas de negócios.</p>

<p>Com suporte para Python, Scala, R e SQL, além de bibliotecas e estruturas de aprendizado profundo como TensorFlow, Pytorch e Scikit-learn ao utilizarmos o Databricks eliminamos toda a dureza e complexidade para obter um cluster do Spark. Seus notebooks fornecem uma experiência ininterrupta e sem falhas de gerenciamento graças à integração com o principal provedor de nuvem, incluindo o Amazon AWS e o Microsoft Azure. </p>

##### Atividades realizadas:

1.  Introdução ao ambiente do databricks.
2.  Utilização do Spark.
3.  Linguagens de programação.
4.  Entender strutura de dados.

## Day 02

<p>Utilizar o Databriks com certeza foi uma surpresa, um ambiente colaborativo ágil e performático. Logo após toda a preparação do ambiente de dados, importação de CSV's, contrução dos cluster's por meio da interface do Databricks e criação de tabelas por meio de SQL, fizemos uma primeira análise exploratória, removendo dados nulos, organizando dados através da regra de negócio e os validando. segue o link do <a href="https://github.com/VINIA6/EBAC/blob/master/Notebooks_Origin/EBAC%20-%20Parte%2002.sql">Notebook</a>:</p>

##### Atividade realizadas: 

1.  Utilizar databricks
2.  Criar cluster
3.  Criar tabelas (tbVendas e tbPotencial)
4.  Consistir base de dados – nulos, numéricos, regras de negócio.
5.  Utilização de linguagem python e sql na validação de dados.


## Day 03
<p>Devido ao ambiente colaborativo que estamos usando ser de forma gratuita, existe uma certa limitação, a limitação que tivemos foi a de que o cluster é incerrado no prazo de duas horas, após isso devemos criar um novo cluster para trabalhar. Desta vez ao criar os clusters não utilizamos a interface do Databricks, utilizamos a criação dos clusters por meio de cósigo fonte em python que a própria ferramenta nos disponibiliza.</p>
<p>Após toda a preparação da estrutura de dados feitas no Day 02, podemos começar a analisar mais profundamente estes dados, para trabalhar com pesquisas e análises tivemos um desafio, </p>
<img src="https://github.com/VINIA6/EBAC/blob/master/img/des_ana.png?raw=true" height="450" title="img"/>
<p>Tendo que fazer pesquisas com a linguagem python na tabela de vendas, consultando o "Total de clientes", "Valor total vendido", "Categorias", "SubCategorias", "Produtos", "Cidades" e com SQL puro na tabela potencial consultando o "Total de clientes", "Valor total vendido", "Residencial", "Hibrida","Comercial", "Industrial" e o "Período" podemos ver todos os códigos utilizados neste <a href="https://github.com/VINIA6/EBAC/blob/master/Notebooks_Origin/EBAC%20-%20Parte%2003.sql">Notebook</a>.</p>
<p>Após toda a consulta temos o seguinte resultado.</p>
<img src="https://github.com/VINIA6/EBAC/blob/master/img/des_ana2.png?raw=true" height="450" title="img"/>

##### Atividade realizadas: 

1.  Clonando cluster e recriando tabelas finais. (Recriar tabelas usando Python)
2.  Iniciar apresentação em Power Point com resumo das tabelas.
3.  Utilizar recurso de gráfico no Databricks.
4.  Preparar dados para serem utilizados no Microsoft SQL Server

## Day 04

##### Atividade realizadas: 

<p>Foi a primeira vez que trablhei com o Microsoft SQL Server e foi de grande aprendizado, semore trablhei com PostgreSQL, não são tão diferentes, já que são banco SQL alguma sintaxes mudam um pouco mas no geral são bem semelhantes, o Databricks serviu mais como uma plataforma de manipulação de BigData, após a instalação e configuração do banco SQL Server introudizimos os dados do Databricks no banco.</p>

1. Utilizar Microsoft SQL server para continuar análises
2. Instalar MSSQL – passo-a-passo. (Engine & Management Studio)
3. Transferir dados do Databricks para MSSQL (Via Bulk Insert)


## Day 05
<p>Realizar consultas, deixar um *script* padrão pra geração de novos dados e geração de consultas importantes para identificar novas oportunidades de vendas, criamos um slide que possibiita a vizualização organizada das consultas. </p>

<img src="https://github.com/VINIA6/EBAC/blob/master/img/pag2.png?raw=true" height="450" title="img"/>
<img src="https://github.com/VINIA6/EBAC/blob/master/img/pag3.png?raw=true" height="450" title="img"/>
<img src="https://github.com/VINIA6/EBAC/blob/master/img/pag4.png?raw=true" height="450" title="img"/>
<img src="https://github.com/VINIA6/EBAC/blob/master/img/pag5.png?raw=true" height="450" title="img"/>
<img src="https://github.com/VINIA6/EBAC/blob/master/img/pag6.png?raw=true" height="450" title="img"/>

##### Atividade realizadas: 

1. Criação de scripts no MSSQL.
2. Desenvolver Rankings
3. Identificar oportunidades de vendas.

## Day 06

<p>Sabemos que manipular dados e setar nossas consultas s mão em um slide não e a melhor forma de se fazer uma boa análise, sempre buscamos otimizar nosso tempo e trabhar de forma mias eficiente, para isso o Power BI vem ajudar nossas análises, com gráficos consultas rápidas diretamente do banco de dados entre outras funcionalidades. Neste dia nos introduzimos ao Power BI e criamos algumas views no SQL para serem buscadas pelo Power BI. </p>
 
##### Atividade realizadas: 

1. Introdução ao Power BI
2. Instalação do Power BI
3. Criar view no SQL.
4. Carregar Dados para Power BI

## Day 07

<p>Como havia dito anteriormente, criar slides e prenchelos manualmente não é a melhor forma de se fazer, então criamos um dashboard com informações relevantes para nosso cliente, sempre buscando atender as metas para a construBem. </p>

##### Atividade realizadas: 

1. Criar dashboard/relatório no Power BI
2. Utilizar inteligência artificial do Power BI para obter insights sobre os dados
3. Entender diferenças entre períodos e explicar variações dos dados.



