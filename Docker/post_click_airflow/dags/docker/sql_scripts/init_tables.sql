select 1;

drop table if exists s1;
create table s1
    (
        id integer,
        attribute1 varchar(10),
        valid_from_dttm timestamp without time zone,
        valid_to_dttm timestamp without time zone
    );
drop table if exists s2;
create table s2
    (
        id integer,
        attribute2 varchar(10),
        valid_from_dttm timestamp without time zone,
        valid_to_dttm timestamp without time zone
    );

insert into s1 
(id, attribute1, valid_from_dttm, valid_to_dttm)
values
(1, 1, '2000-01-01'::timestamp, '2000-01-05'::timestamp),
(1, 2, '2000-01-05'::timestamp, '2000-01-07'::timestamp),
(1, 3, '2000-01-07'::timestamp, null);

insert into s2
(id, attribute2, valid_from_dttm, valid_to_dttm)
values
(1, 'a', '2000-01-03'::timestamp, '2000-01-09'::timestamp),
(1, 'b', '2000-01-09'::timestamp, null);
--id	a1	vf	vt
--1	  1	  1	  5
--1	  2	  5	  7
--1	  3	  7	  5999
--
--
--id	a2	vf	vt
--1	  a	  3	  9
--1	  b	  9	  5999

--select * from s1;
--select * from s2;

--  id	a1	a2	vf	vt
--  1	1	n	1	3
--  1	1	a	3	5
--  1	2	a	5	7
--  1	3	a	7	9
--  1	3	b	9	5999

--all dates
with allDates as (
  select id, valid_from_dttm
  from s1
  union
  select id, valid_from_dttm
  from s2
  )
select  id, 
        valid_from_dttm, 
        COALESCE(LEAD(valid_from_dttm) over (partition by id order by valid_from_dttm), '5999-01-01'::timestamp) as valid_to_dttm
from allDates
order by valid_from_dttm, valid_to_dttm;

  with allDates as (
  select id, valid_from_dttm
  from s1
  union
  select id, valid_from_dttm
  from s2
  ), allDates2 as (
    select  id, 
            valid_from_dttm, 
            COALESCE(LEAD(valid_from_dttm) over (partition by id order by valid_from_dttm), '5999-01-01'::timestamp) as valid_to_dttm
    from allDates
  )
  select ad.id, s1.attribute1, s2.attribute2, ad.valid_from_dttm, ad.valid_to_dttm
  from allDates2 ad
  left join s1 
  on  ad.id = s1.id
  and ad.valid_from_dttm >= s1.valid_from_dttm
  and (ad.valid_to_dttm <= s1.valid_to_dttm or s1.valid_to_dttm is null)
  left join s2
  on  ad.id = s2.id
  and ad.valid_from_dttm >= s2.valid_from_dttm
  and (ad.valid_to_dttm <= s2.valid_to_dttm or s2.valid_to_dttm is null)