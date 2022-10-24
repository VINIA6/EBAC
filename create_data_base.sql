create table tbVendas_Final (
CodCliente	int , 
Categoria	varchar(50), 
SubCategoria varchar(50), 
Produto		varchar(50), 
Ano			int, 
Mes			int, 
Cidade		varchar(50), 
Valor		float, 
Volume		float)

CREATE INDEX index1 ON tbVendas_Final (CodCliente);

select * from tbVendas_Final

truncate table tbVendas_Final

BULK INSERT tbVendas_Final
    FROM 'C:\Users\Usuário\Documents\Vinícius\EBAC\Dados para SQL\vendas.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  
	ROWTERMINATOR = '0x0a'
    )

select * from tbVendas_Final


create table tbPotencial_Final (
CodCliente				int, 
Ano						int, 
Area_Comercial			float, 
Area_Hibrida			float, 
Area_Residencial		float, 
Area_Industrial			float, 
ValorPotencial			float
)

CREATE INDEX index1 ON tbPotencial_Final (CodCliente);

truncate table tbPotencial_Final

BULK INSERT tbPotencial_Final
    FROM 'C:\Users\Usuário\Documents\Vinícius\EBAC\Dados para SQL\potencial.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  
	ROWTERMINATOR = '0x0a'
   
    )


select * from tbPotencial_Final

--*************************************************--
--	Criando tabela temporária com a consulta abaixo.
select	a.ano,
		a.codcliente,
		sum(distinct b.valorpotencial) as ValorPotencial,
		sum(a.valor) as ValorVendas
into	#temp1
from	tbvendas_final a
inner	join tbPotencial_final b
on		a.CodCliente = b.CodCliente 
and		a.Ano = b.Ano 
group	by a.ano, a.codcliente

-- Verificando tabela criada 
select * from #temp1

--Formatando consulta na tabela temporária
select	Ano, 
		format(sum(ValorPotencial),'###,##0.00','pt-br') as ValorPotencial,
		format(sum(ValorVendas),'###,##0.00','pt-br') as ValorVendas,
		format(sum(ValorPotencial) - sum(ValorVendas),'###,##0.00','pt-br') as Oportunidade,
		abs(((sum(ValorVendas)/sum(ValorPotencial))*100)-100) [Oportunidade%]
from	#temp1
group	by Ano
order	by ano

-- Verificando porcentagem de oportunidades e alcance 

select	Ano, 
		round(abs(((sum(ValorVendas)/sum(ValorPotencial))*100)-100),1) [Oportunidade%],
		round(abs(abs(((sum(ValorVendas)/sum(ValorPotencial))*100)-100)-100),1) [Alcan�ado%]
from	#temp1
group	by Ano
order	by ano

-- Realizando consultas para verificar perda de clientes 
-- A CONSULTA FOI FEITA ENTRE JAN DE 2020 E AGO DE 2022

select	* 
from	(
		select	Ano,
				Categoria,
				Valor
		from	tbvendas_final 
		where	mes <= 8
		) t 
pivot (sum(Valor) for Categoria in ([X],[XTZ250],[XT660],[CB750])) p
order by ano

-- Quantidade de clientes 
select	Ano,
		count(distinct codcliente) as [#Clientes]
from	tbvendas_final 
where	mes <=8 
group	by Ano
order by ano

-- Informações sobre potencial de vendas, quero trablahar com clientes com potencial de vendas mas n efetuaram compras.

select	Ano, 
		sum(Area_Comercial) as Area_Comercial, 
		sum(Area_Hibrida) as Area_Hibrida, 
		sum(Area_residencial) as Area_residencial, 
		sum(Area_industrial) as Area_industrial, 

		sum(Area_Comercial)+
		sum(Area_Hibrida)+
		sum(Area_residencial)+
		sum(Area_industrial) as AreaTotal,

		sum(ValorPotencial) as ValorVendasPotencial
into	#tmp_nc
from	tbPotencial_final  a
where	not exists (select	1 
					from	tbVendas_final b
					where	a.CodCliente = b.CodCliente 
					and		a.Ano = b.Ano )
group	by Ano

--Transformar em percentual
select	* from	#tmp_nc order by ano

select	Ano,
		Area_Comercial/AreaTotal*100 as [Area_Comercial%],
		Area_Hibrida/AreaTotal*100 as [Area_Hibrida%],
		Area_residencial/AreaTotal*100 as [Area_residencial%],
		Area_industrial/AreaTotal*100 as [Area_industrial%],
		ValorVendasPotencial
from	#tmp_nc order by ano

--Total de clientes
select	a.ano, count(distinct codcliente) as Qtde
from	tbPotencial_final  a
where	not exists (select	1 
					from	tbVendas_final b
					where	a.CodCliente = b.CodCliente 
					and		a.Ano = b.Ano )
group by a.ano
with rollup


--TOP 10 cidades

select	top 10 
		Cidade, 
		sum(valor) as Valor 
from	tbVendas_final
Group	by Cidade 
order	by 2 desc

select *
into	#tmp_cidade
from	(
select	top 10 
		Cidade, 
		sum(valor) as Valor 
from	tbVendas_final
Group	by Cidade 
order	by 2 desc
) x order by 2

--Total das Top10 Cidades
select format(SUM(valor), '###, ##0.00','pt') from #tmp_cidade

--Quantidade de cidades
select count(distinct cidade) from tbVendas_final

--Percetual das 10 cidades
Declare @total_top10 as float
select @total_top10 = SUM(valor) from #tmp_cidade
select round(@total_top10/SUM(valor)*100,2) as Perc from tbVendas_final

select count(distinct codcliente) from tbVendas_final where cidade in (select cidade from #tmp_cidade)

--Quantidade de transa��es
select count(codcliente) from tbVendas_final where cidade in (select cidade from #tmp_cidade)
--Total transa��es
select count(codcliente) from tbVendas_final

--Como aumentar as vendas ?

With Clientes AS
(
        select	CodCliente,
				produto
		from	tbVendas_final 
		group	by produto, CodCliente
)
SELECT *
into	#tmp_produto1
FROM	Clientes
--##	Grafico de rosca
select	Categoria, sum(Valor) as Valor
from	(select codcliente, 
				count(codcliente) as Qtde 
		from	#tmp_produto1 
		group	by codcliente 
		having	count(codcliente) =1 ) as X
inner	join tbVendas_final b
on		x.CodCliente = b.CodCliente
group	by Categoria
order by 1
--##

select	 sum(Valor) as Valor
from	(select codcliente, 
				count(codcliente) as Qtde 
		from	#tmp_produto1 
		group	by codcliente 
		having	count(codcliente) =1 ) as X
inner	join tbVendas_final b
on		x.CodCliente = b.CodCliente
order by 1

select distinct codcliente from tbVendas_final

select distinct Produto
	from	(select codcliente, 
				count(codcliente) as Qtde 
		from	#tmp_produto1 
		group	by codcliente 
		having	count(codcliente) =1 ) as X
inner	join tbVendas_final b
on		x.CodCliente = b.CodCliente

select * from #tmp_produto1

CREATE view [dbo].[vw_Potencial]

as

select	a.codcliente, a.Ano, a.Area_Comercial, a.Area_Hibrida, a.Area_Residencial, a.Area_Industrial, ValorPotencial, 
		sum(valor) as ValorVendas
from	tbPotencial_final a
left	join tbVendas_Final b
on		a.codcliente = b.codcliente
and		a.ano		= b.ano
group	by a.codcliente, a.Ano, a.Area_Comercial, a.Area_Hibrida, a.Area_Residencial, a.Area_Industrial, ValorPotencial
GO

