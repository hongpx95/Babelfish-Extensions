use master;
go

create table t2267(a int);
go

DECLARE c CURSOR READ_ONLY FOR SELECT * FROM t1058 FOR READ ONLY
go

DECLARE c CURSOR SCROLL_LOCKS FOR SELECT * FROM t1058 FOR READ ONLY
go

DECLARE c CURSOR OPTIMISTIC FOR SELECT * FROM t1058 FOR READ ONLY
go
