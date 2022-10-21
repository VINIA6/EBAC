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

<p>Utilizar o Databriks com certeza foi uma surpresa, um ambiente colaborativo ágil e performático. Logo após toda a preparação do ambiente de dados, importação de CSV's, contrução dos cluster's por meio da interface do Databricks e criação de tabelas por meio de SQL, fizemos uma primeira análise exploratória, removendo dados nulos, organizando dados através da regra de negócio e validando os dados. segue o link do <a href="https://github.com/VINIA6/EBAC/blob/master/Notebooks_Origin/EBAC%20-%20Parte%2002.sql">Notebook</a>:</p>

##### Atividade realizadas: 

1.  Utilizar databricks
2.  Criar cluster
3.  Criar tabelas (tbVendas e tbPotencial)
4.  Consistir base de dados – nulos, numéricos, regras de negócio.
5.  Utilização de linguagem python e sql na validação de dados.


## Day 03
<p>Devido ao ambiente colaborativo que estamos usando ser de forma gratuita, existe uma certa limitação, a limitação que tivemos foi a de que o cluster é incerrado no prazo de duas horas, após isso devemos criar um novo cluster para trabalhar. Desta vez ao criar os clusters não utilizamos a interface do Databricks, utilizamos a criação dos clusters por meio de cósigo fonte em python que a própria ferramenta nos disponibiliza.</p>
<p>Após toda a preparação da estrutura de dados feitas no Day 02, podemos começar a analisar mais profundamente estes dados, para trabalhar com pesquisas e análises tivemos um desafio, </p>
##### Atividade realizadas: 

1.  Clonando cluster e recriando tabelas finais. (Recriar tabelas usando Python)
2.  Iniciar apresentação em Power Point com resumo das tabelas.
3.  Utilizar recurso de gráfico no Databricks.
4.  Preparar dados para serem utilizados no Microsoft SQL Server
