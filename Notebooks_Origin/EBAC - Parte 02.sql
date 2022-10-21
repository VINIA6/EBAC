-- Databricks notebook source
-- select * from tbvendas 
-- select * from tbpotencial

-- COMMAND ----------

-- MAGIC %py
-- MAGIC 
-- MAGIC #Listar os diretorios no BDFS
-- MAGIC 
-- MAGIC # dbutils.fs.ls("/FileStore/tables/vinia6")
-- MAGIC # df_vendas = (spark.read
-- MAGIC #             .format("csv")
-- MAGIC #             .option("header","true")
-- MAGIC #             .option("inferSchema","true")
-- MAGIC #             .load("/FileStore/tables/vinia6/Vendas.csv")
-- MAGIC #             )
-- MAGIC # display(df_vendas)
-- MAGIC 
-- MAGIC # df_potencial = (spark.read
-- MAGIC #             .format("csv")
-- MAGIC #             .option("header","true")
-- MAGIC #             .option("inferSchema","true")
-- MAGIC #             .load("/FileStore/tables/vinia6/Vendas_Potencial.csv")
-- MAGIC #             )
-- MAGIC # df_potencial.show()

-- COMMAND ----------

-- select count(*) from tbvendas 

-- COMMAND ----------

-- MAGIC %py 
-- MAGIC # display(df_vendas.count())

-- COMMAND ----------

-- select categoria, count(1) from tbvendas group by categoria

-- COMMAND ----------

-- MAGIC %py 
-- MAGIC # display(df_vendas.groupby("categoria").count())

-- COMMAND ----------

-- MAGIC %py 
-- MAGIC #Estamos apgando as tabelas que foram criadas na aula passada, 
-- MAGIC #pois as tabelas ficaram no cluster passado, dando interferêncai no clone do cluster atual
-- MAGIC dbutils.fs.ls("/user/hive/warehouse")
-- MAGIC dbutils.fs.rm("/user/hive/warehouse/tbvendas_final", recurse=True)
-- MAGIC dbutils.fs.rm("/user/hive/warehouse/tbpotencial_final", recurse=True)

-- COMMAND ----------

-- Criando tabelas no BD tbvendas_final e tbpotencial_final
create table tbvendas_final (Client_ID int, Categoria string, Subcategoria string, Produto string, Ano int, Mes int, Cidade string, Valor double, Volume double);
Create table tbpotencial_final (Client_ID int, Ano int, Area_Comercial double, Area_Hibrida double, Area_Residencial double, Area_Industrial double, ValorPotencial double);


-- COMMAND ----------

-- Inserindo dados na tabela tbvendas_final
insert into tbvendas_final (Client_ID, Categoria , SubCategoria , Produto , Ano , Mes , Cidade , Valor , Volume)
select replace(Client_ID,'Client #','') ,Categoria,SubCategoria,Produto,Year,Month,Cidade,Valor,Volume from tbvendas where year in ('2020', '2021','2022')
 

-- COMMAND ----------

-- Inserindo dados na tabela tbpotencial_final
insert into tbpotencial_final (Client_ID , Ano , Area_Comercial , Area_Hibrida , Area_Residencial , Area_Industrial , ValorPotencial)
select replace(Client_ID,'Client #',''),    Year, Area_Comercial, Area_Hibrida, Area_Residencial, Area_Industrial, BRL_Potencial from tbpotencial

-- COMMAND ----------

-- Verificando dados nulos 
Select *
from tbvendas_final 
where isnull(`Client_ID`) = true
or isnull(`Categoria`) = true
or isnull(`Subcategoria`) = true
or isnull(`Produto`) = true
or isnull(`Ano`) = true
or isnull(`Mes`) = true
or isnull(`Cidade`) = true
or isnull(`Valor`) = true
or isnull(`Volume`) = true

-- COMMAND ----------

-- Apagando registros com valor nulo 
delete from tbvendas_final 
where isnull(`Client_ID`) = true
or isnull(`Categoria`) = true
or isnull(`Subcategoria`) = true
or isnull(`Produto`) = true
or isnull(`Ano`) = true
or isnull(`Mes`) = true
or isnull(`Cidade`) = true
or isnull(`Valor`) = true
or isnull(`Volume`) = true

-- COMMAND ----------

--  Apagando registros nulos 
Select count(1)
from tbpotencial_final 
where isnull(`Client_ID`) = true
or isnull(`Ano`) = true
or isnull(`Area_Comercial`) = true
or isnull(`Area_Hibrida`) = true
or isnull(`Area_Residencial`) = true
or isnull(`Area_Industrial`) = true
or isnull(`ValorPotencial`) = true

-- COMMAND ----------

-- Verificando subcategorias
select distinct subcategoria from tbvendas_final order by 1;

-- COMMAND ----------

-- Deletando categoria 99
delete from tbvendas_final where subcategoria = 'Sub-Categoria 99'

-- COMMAND ----------

select count(distinct Categoria) as Qtde, subcategoria from tbvendas_final group by subcategoria having count(distinct Categoria) > 1

-- COMMAND ----------

-- Cada sub-categoria pertencia apenas a uma categoria, logo organizamos abaixo 

-- COMMAND ----------

select distinct Categoria, Subcategoria from tbvendas_final where Subcategoria in ('Sub-Categoria 8','Sub-Categoria 7') order by 2

-- COMMAND ----------

select Categoria, Subcategoria, count(1) from tbvendas_final where Categoria in ('XTZ250','XT660','CB750') group by Categoria, Subcategoria order by 1

-- COMMAND ----------

delete from tbvendas_final where categoria = 'XT660' and subcategoria= 'Sub-Categoria 8';
delete from tbvendas_final where categoria = 'XTZ250' and subcategoria= 'Sub-Categoria 7';

-- COMMAND ----------

select * from tbvendas_final

-- COMMAND ----------

select * from tbpotencial_final

-- COMMAND ----------


