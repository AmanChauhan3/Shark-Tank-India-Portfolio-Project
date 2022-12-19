
----------------------------------------------------------------------
/*
SQL Queries For Exploring Shark Tank India Data
Let Explore Some Insights From The Data
*/
----------------------------------------------------------------------


select * from Project

-- Count of Total Episodes
select count(distinct(episodes)) "Total Episodes" from Project
select max(episodes) "Total Episodes" from project

-- Total Males
select sum(male) "Total Males" from Project

-- Total Females
select sum(female) "Total Females" from Project

-- Total Sectors
select count(distinct(sector)) "Total Sectors" from project

-- Total Unique Brand Pitched in the show
select count(brand) "Total Brand" from project

-- Pitches converted into funding
select count(*) "Total Pitches", sum(a."Pitches Converted") "Total Pitches Converted"  from (
select Total_Deal , case when Total_Deal > 0 then 1 else 0 end "Pitches Converted" from project) a

-- Pitches Converted into %age
select round(cast(sum(a."Pitches Converted")as float) / cast(count(*)as float)*100,2) "Total Funding Received in Percentage"  from (
select Total_Deal , case when Total_Deal > 0 then 1 else 0 end "Pitches Converted" from project) a

-- Gender Ratio 
select round(sum(Female)/sum(male)*100,2)"Gender Ratio" from Project

-- Total Amount Invested
select sum(Total_Deal) "Total Amount Invested in Lakhs" from Project

-- Avg Equity taken
select round(avg(a.Total_Equity),2) "Avg Equity" from (
select Total_Equity  from Project where Total_Equity  > 0) a

-- Highest Deal
select max(Total_Deal)"Highest Deal Taken in Lakhs" from project

-- Highest Equity Taken
select max([Total_Equity ]) "Highest Equity Taken in %" from project

-- Startups Having Atleast one Women
select count(female) from project where female>0

-- Pitches Converted having atleast one female
select count(a.female) from(
select * from Project where deal<> 'no deal') a
where a.female > 0

-- Avg Team Members
select round(avg(Team_members),0) "Avg Team Members" from project

-- Avg Amount Invested per deal
select round(avg(a.Total_Deal),0) "Avg Amount Invested in Lakhs" from (
select * from project where deal <> 'No Deal') a

-- Most number of contestant coming from which age
select Avg_age, count(Avg_age)"Count of avgage" from project group by Avg_age order by "Count of AvgAge" desc

-- Most number of contestant coming from which location
select location, count(location) "count of location" from project group by location order by "count of location" desc

-- Most number of startups coming from which sector
select sector, count(sector)"Count of Sectors" from project group by sector order by "Count of Sectors" desc

-- Maximum deal taken from which sector
select sector, max(Total_Deal) "Max Deal in Lakhs" from project where deal <> 'No Deal' group by sector order by "Max Deal in Lakhs" desc


------------------------------------------------------------------------------------------------------


-- Ashneer Stats
   select m."sharks",m."Amount Invested",m."Avg Equity Taken",m."Total Episodes", n."Total Deals" from (
   select a."sharks", a."Amount Invested",a."Avg Equity Taken",b."Total Episodes"  from (
   select 'Ashneer' "Sharks", sum(Ashneer_Deal)"Amount Invested", round(avg(Ashneer_Equity),2)"Avg Equity Taken" from project 
   where Ashneer_Equity <> 0 and Ashneer_Equity is not null) a
   inner join (
   select 'Ashneer' "Sharks", count(distinct(Episodes))"Total Episodes" from project where Ashneer_Deal is not null) b
   on a."Sharks" = b."Sharks") m
   inner join(
   select 'Ashneer' "Sharks", count(Ashneer_Deal)"Total Deals" from project 
   where Ashneer_Deal is not null and Ashneer_Deal <> 0) n
   on m."Sharks" = n."Sharks"
union all
-- Namita Stats
   select m."sharks",m."Amount Invested",m."Avg Equity Taken",m."Total Episodes", n."Total Deals" from (
   select a."sharks", a."Amount Invested",a."Avg Equity Taken",b."Total Episodes"  from (
   select 'Namita' "Sharks", sum(Namita_Deal)"Amount Invested", round(avg(Namita_Equity),2)"Avg Equity Taken" from project 
   where Namita_Equity <> 0 and Namita_Equity is not null) a
   inner join (
   select 'Namita' "Sharks", count(distinct(Episodes))"Total Episodes" from project where Namita_Deal is not null) b
   on a."Sharks" = b."Sharks") m
   inner join(
   select 'Namita' "Sharks", count(Namita_Deal)"Total Deals" from project 
   where Namita_Deal is not null and Namita_Deal <> 0) n
   on m."Sharks" = n."Sharks"
Union All
--Anupam Stats
		select m."Sharks",m."Total Amount Invested",m."Avg Equity Taken",m."Total Episodes",n."Total Deal" from(	
	select a."Sharks", a."Total Amount Invested",a."Avg Equity Taken",b."Total Episodes" from(
	Select 'Anupam' "Sharks", sum(Anupam_Deal) "Total Amount Invested", round(Avg(Anupam_Equity),2) "Avg Equity Taken" from Project
	where Anupam_Equity <> 0) a
	inner join(
	select 'Anupam' "Sharks", count(Distinct(Episodes)) "Total Episodes" from Project where Anupam_Deal is not null) b
	on a."Sharks" = b."Sharks") m
	inner join(
	select 'Anupam' "Sharks", count(Anupam_Deal) "Total Deal" from project where Anupam_Deal <> 0) n
	on m."Sharks" = n."Sharks"
Union All
--Vineeta Stats
			select m."Sharks", m."Total Amount Invested", m."Avg Equity", m."Total Episodes", n."Total Deal" from(		
		select a."Sharks", a."Total Amount Invested", a."Avg Equity", b."Total Episodes" from (
	select 'Vineeta' "Sharks", sum(Vineeta_Deal) "Total Amount Invested", round(avg(Vineeta_Equity),2) "Avg Equity" from Project
	where Vineeta_Equity <> 0 and Vineeta_Equity is not null) a
		Inner Join(
			select 'Vineeta' "Sharks", count(distinct(Episodes)) "Total Episodes" from Project where Vineeta_Deal is not null) b
			on a."Sharks" = b."Sharks") m
		Inner Join(
			select 'Vineeta' "Sharks", count(Vineeta_Deal) "Total Deal" from Project where Vineeta_Deal is not null and Vineeta_Deal <> 0) n
			on m."Sharks" = n."Sharks"

--Aman Stats
			select m."Sharks", m."Total Amount Invested", m."Avg Equity", m."Total Episodes", n."Total Deal" from(		
		select a."Sharks", a."Total Amount Invested", a."Avg Equity", b."Total Episodes" from (
	select 'Aman' "Sharks", sum(Aman_Deal) "Total Amount Invested", round(avg([Aman_Equity ]),2) "Avg Equity" from Project
	where [Aman_Equity ] <> 0 and [Aman_Equity ] is not null) a
		Inner Join(
			select 'Aman' "Sharks", count(distinct(Episodes)) "Total Episodes" from Project where Aman_Deal is not null) b
			on a."Sharks" = b."Sharks") m
		Inner Join(
			select 'Aman' "Sharks", count(Aman_Deal) "Total Deal" from Project where Aman_Deal is not null and Aman_Deal <> 0) n
			on m."Sharks" = n."Sharks"

--Peyush Stats
			select m."Sharks", m."Total Amount Invested", m."Avg Equity", m."Total Episodes", n."Total Deal" from(		
		select a."Sharks", a."Total Amount Invested", a."Avg Equity", b."Total Episodes" from (
	select 'Peyush' "Sharks", sum(Peyush_Deal) "Total Amount Invested", round(avg(Peyush_Equity),2) "Avg Equity" from Project
	where Peyush_Equity <> 0 and Peyush_Equity is not null) a
		Inner Join(
			select 'Peyush' "Sharks", count(distinct(Episodes)) "Total Episodes" from Project where Peyush_Deal is not null) b
			on a."Sharks" = b."Sharks") m
		Inner Join(
			select 'Peyush' "Sharks", count(Peyush_Deal) "Total Deal" from Project where Peyush_Deal is not null and Peyush_Deal <> 0) n
			on m."Sharks" = n."Sharks"

-- Ghazal Stats
			select m."Sharks", m."Total Amount Invested", m."Avg Equity", m."Total Episodes", n."Total Deal" from(		
		select a."Sharks", a."Total Amount Invested", a."Avg Equity", b."Total Episodes" from (
	select 'Ghazal' "Sharks", sum(Ghazal_Deal) "Total Amount Invested", round(avg(Ghazal_Equity),2) "Avg Equity" from Project
	where Ghazal_Equity <> 0 and Ghazal_Equity is not null) a
		Inner Join(
			select 'Ghazal' "Sharks", count(distinct(Episodes)) "Total Episodes" from Project where Ghazal_Deal is not null) b
			on a."Sharks" = b."Sharks") m
		Inner Join(
			select 'Ghazal' "Sharks", count(Ghazal_Deal) "Total Deal" from Project where Ghazal_Deal is not null and Ghazal_Deal <> 0) n
			on m."Sharks" = n."Sharks"


-------------------------------------------------------------------------------------------------------


-- Creating View of Ashneer Stats

create or alter view Ashneer_Stats
as
	   select m."Sharks",m."Amount Invested",m."Avg Equity Taken",m."Total Episodes", n."Total Deals" from (
   select a."Sharks", a."Amount Invested",a."Avg Equity Taken",b."Total Episodes"  from (
   select 'Ashneer' "Sharks", sum(Ashneer_Deal)"Amount Invested", round(avg(Ashneer_Equity),2)"Avg Equity Taken" from project 
   where Ashneer_Equity <> 0 and Ashneer_Equity is not null) a
   inner join (
   select 'Ashneer' "Sharks", count(distinct(Episodes))"Total Episodes" from project where Ashneer_Deal is not null) b
   on a."Sharks" = b."Sharks") m
   inner join(
   select 'Ashneer' "Sharks", count(Ashneer_Deal)"Total Deals" from project 
   where Ashneer_Deal is not null and Ashneer_Deal <> 0) n
   on m."Sharks" = n."Sharks"

   select * from Ashneer_Stats

-- Creating View of Namita Stats

Create or Alter View Namita_Stats
as
	select m."Sharks",m."Amount Invested",m."Avg Equity Taken",m."Total Episodes", n."Total Deals" from (
   select a."Sharks", a."Amount Invested",a."Avg Equity Taken",b."Total Episodes"  from (
   select 'Namita' "Sharks", sum(Namita_Deal)"Amount Invested", round(avg(Namita_Equity),2)"Avg Equity Taken" from project 
   where Namita_Equity <> 0 and Namita_Equity is not null) a
   inner join (
   select 'Namita' "Sharks", count(distinct(Episodes))"Total Episodes" from project where Namita_Deal is not null) b
   on a."Sharks" = b."Sharks") m
   inner join(
   select 'Namita' "Sharks", count(Namita_Deal)"Total Deals" from project 
   where Namita_Deal is not null and Namita_Deal <> 0) n
   on m."Sharks" = n."Sharks"

-- Creating View of Anupam Stats
Create or Alter View Anupam_Stats
as
	select m."Sharks",m."Total Amount Invested",m."Avg Equity Taken",m."Total Episodes",n."Total Deal" from(	
	 select a."Sharks", a."Total Amount Invested",a."Avg Equity Taken",b."Total Episodes" from(
	Select 'Anupam' "Sharks", sum(Anupam_Deal) "Total Amount Invested", round(Avg(Anupam_Equity),2) "Avg Equity Taken" from Project
	 where Anupam_Equity <> 0) a
	inner join(
	select 'Anupam' "Sharks", count(Distinct(Episodes)) "Total Episodes" from Project where Anupam_Deal is not null) b
	 on a."Sharks" = b."Sharks") m
	inner join(
	select 'Anupam' "Sharks", count(Anupam_Deal) "Total Deal" from project where Anupam_Deal <> 0) n
	 on m."Sharks" = n."Sharks"

-- Creating View of Vineeta Stats
Create or alter View Vineeta_Stats
as
			select m."Sharks", m."Total Amount Invested", m."Avg Equity", m."Total Episodes", n."Total Deal" from(		
		select a."Sharks", a."Total Amount Invested", a."Avg Equity", b."Total Episodes" from (
	select 'Vineeta' "Sharks", sum(Vineeta_Deal) "Total Amount Invested", round(avg(Vineeta_Equity),2) "Avg Equity" from Project
	where Vineeta_Equity <> 0 and Vineeta_Equity is not null) a
		Inner Join(
			select 'Vineeta' "Sharks", count(distinct(Episodes)) "Total Episodes" from Project where Vineeta_Deal is not null) b
			on a."Sharks" = b."Sharks") m
		Inner Join(
			select 'Vineeta' "Sharks", count(Vineeta_Deal) "Total Deal" from Project where Vineeta_Deal is not null and Vineeta_Deal <> 0) n
			on m."Sharks" = n."Sharks"

Select * from Vineeta_Stats

-- Creating View of Aman Stats
Create or alter View Aman_Stats
as
select m."Sharks", m."Total Amount Invested", m."Avg Equity", m."Total Episodes", n."Total Deal" from(		
		select a."Sharks", a."Total Amount Invested", a."Avg Equity", b."Total Episodes" from (
	select 'Aman' "Sharks", sum(Aman_Deal) "Total Amount Invested", round(avg([Aman_Equity ]),2) "Avg Equity" from Project
	where [Aman_Equity ] <> 0 and [Aman_Equity ] is not null) a
		Inner Join(
			select 'Aman' "Sharks", count(distinct(Episodes)) "Total Episodes" from Project where Aman_Deal is not null) b
			on a."Sharks" = b."Sharks") m
		Inner Join(
			select 'Aman' "Sharks", count(Aman_Deal) "Total Deal" from Project where Aman_Deal is not null and Aman_Deal <> 0) n
			on m."Sharks" = n."Sharks"

Select * from Aman_Stats

-- Creating View of Peyush Status
Create or alter View Peyush_Stats
as
			select m."Sharks", m."Total Amount Invested", m."Avg Equity", m."Total Episodes", n."Total Deal" from(		
		select a."Sharks", a."Total Amount Invested", a."Avg Equity", b."Total Episodes" from (
	select 'Peyush' "Sharks", sum(Peyush_Deal) "Total Amount Invested", round(avg(Peyush_Equity),2) "Avg Equity" from Project
	where Peyush_Equity <> 0 and Peyush_Equity is not null) a
		Inner Join(
			select 'Peyush' "Sharks", count(distinct(Episodes)) "Total Episodes" from Project where Peyush_Deal is not null) b
			on a."Sharks" = b."Sharks") m
		Inner Join(
			select 'Peyush' "Sharks", count(Peyush_Deal) "Total Deal" from Project where Peyush_Deal is not null and Peyush_Deal <> 0) n
			on m."Sharks" = n."Sharks"

Select * from Peyush_Stats

--Creating View of Ghazal Stats
Create or alter view Ghazal_Stats
as
			select m."Sharks", m."Total Amount Invested", m."Avg Equity", m."Total Episodes", n."Total Deal" from(		
		select a."Sharks", a."Total Amount Invested", a."Avg Equity", b."Total Episodes" from (
	select 'Ghazal' "Sharks", sum(Ghazal_Deal) "Total Amount Invested", round(avg(Ghazal_Equity),2) "Avg Equity" from Project
	where Ghazal_Equity <> 0 and Ghazal_Equity is not null) a
		Inner Join(
			select 'Ghazal' "Sharks", count(distinct(Episodes)) "Total Episodes" from Project where Ghazal_Deal is not null) b
			on a."Sharks" = b."Sharks") m
		Inner Join(
			select 'Ghazal' "Sharks", count(Ghazal_Deal) "Total Deal" from Project where Ghazal_Deal is not null and Ghazal_Deal <> 0) n
			on m."Sharks" = n."Sharks"

select * from Ghazal_Stats


------------------------------------------------------------------------------------------------------


-- All Sharks Stats
select * from Ashneer_Stats
Union all
select * from Namita_Stats
Union all
Select * from Anupam_Stats
Union All
Select * from Vineeta_Stats
Union All
Select * from Aman_Stats
Union All
Select * from Peyush_Stats
Union All
select * from Ghazal_Stats

--------------------------------------------------------------------------------------------------------

-- In which Sector Maximum number of investors Invest their Amount

select Sector, max(Total_Investors )"Number Of Investers",Partners from Project
Group by Sector, Partners
Order by "Number Of Investers" desc



--Ranking the Total Deal Invested By Sharks in Sector and brand By Rank Function  

select Brand,Sector,Total_Deal,  
Dense_rank() over(Partition by sector order by Total_Deal desc) "Rank" from project
where Total_Deal > 0

--------------------------------------------------------------------------------------------------------