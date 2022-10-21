-- Databricks notebook source
-- PYTHON

-- COMMAND ----------

-- MAGIC %py 
-- MAGIC # Total de clientes da tabela tbvendas_final - SQL
-- MAGIC sqlContext.sql("select Count(distinct client_id) as Qtde from tbvendas_final").show()

-- COMMAND ----------

-- MAGIC %py
-- MAGIC # Total de vendas da tabela tbvendas_final - SQL
-- MAGIC sqlContext.sql("select cast(sum(valor) as decimal(18,2)) as ValorTotal from tbvendas_final").show()

-- COMMAND ----------

-- MAGIC %python
-- MAGIC # Arquivo de Vendas - Categoria, Subcategoria, Porduto, Cidade
-- MAGIC sqlContext.sql("select count(distinct cidade) as Cidade , count(distinct categoria) as Categoria, count(distinct Subcategoria) as Subcategoria, count(distinct Produto) as Produto from tbvendas_final").show()

-- COMMAND ----------

-- SQL

-- COMMAND ----------

--Arquivo potencial
--executar apenas em uma query
 
select Count(distinct client_id) as Qtde, sum(ValorPotencial) as Valor, sum(area_comercial) as Comercial, sum(area_hibrida) as hibrida, sum(area_residencial) as residencial, sum(area_industrial) as industrial from tbpotencial_final

-- COMMAND ----------

--Periodo
select distinct ano, mes from tbvendas_final order by 1,2

-- COMMAND ----------

--Extração dados Databricks para serem carregados no SQL
select Client_ID, Categoria , SubCategoria , Produto , Ano , Mes , Cidade , cast(Valor as decimal(18,7)) as Valor , Volume from tbvendas_final
-- Vammos em Download full results e baixamos o csv com todos os dados da seleção 

-- COMMAND ----------

--Extração dados Databricks para serem carregados no SQL
select Client_ID , Ano , 
      cast(Area_Comercial as decimal(18,2)) as Area_Comercial , 
      cast(Area_Hibrida as decimal(18,2)) as Area_Hibrida , 
      cast(Area_Residencial as decimal(18,2)) as Area_Residencial , 
      cast(Area_Industrial as decimal(18,2)) as Area_Industrial , 
      cast(ValorPotencial as decimal(18,7)) as ValorPotencial  
from tbpotencial_final
-- Vammos em Download full results e baixamos o csv com todos os dados da seleção 
