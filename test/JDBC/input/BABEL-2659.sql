use master;
go


create table t2659(ansi_defaults varchar(10));
insert into t2659 values ('ok');
go
select ansi_defaults from t2659;
go

create table t2659_2(a varchar(10));
go
-- error: non-existing column
select ansi_defaults from t2659_2;
go

-- error: non-existing table
select ansi_defaults from t2659_3;
go


-- check all keywords touched by fix
CREATE TABLE t2659_all (
  ANSI_DEFAULTS varchar(30),
  ANSI_NULL_DFLT_OFF varchar(30),
  ANSI_NULL_DFLT_ON varchar(30),
  AUTOCOMMIT varchar(30),
  FIPS_FLAGGER varchar(30),
  FMTONLY varchar(30),
  NOEXEC varchar(30),
  PARSEONLY varchar(30),
  REMOTE_PROC_TRANSACTIONS varchar(30),
  SHOWPLAN_ALL varchar(30),
  SHOWPLAN_TEXT varchar(30),
  SHOWPLAN_XML varchar(30),
  XACT_ABORT varchar(30)
);
go

insert into t2659_all values (
 'ANSI_DEFAULTS', 'ANSI_NULL_DFLT_OFF', 'ANSI_NULL_DFLT_ON', 'AUTOCOMMIT', 'FIPS_FLAGGER', 'FMTONLY', 'NOEXEC', 'PARSEONLY', 'REMOTE_PROC_TRANSACTIONS', 'SHOWPLAN_ALL', 'SHOWPLAN_TEXT', 'SHOWPLAN_XML', 'XACT_ABORT');
go

select ansi_defaults, ansi_null_dflt_off, ansi_null_dflt_on, autocommit, fips_flagger, fmtonly, noexec, parseonly, remote_proc_transactions, showplan_all, showplan_text, showplan_xml, xact_abort from t2659_all;
go

drop table t2659;
drop table t2659_2;
drop table t2659_all;
go
