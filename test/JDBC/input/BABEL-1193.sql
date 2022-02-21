-- String to numeric types
-- String -> numeric(p,s)
CREATE TABLE t1 (a text, b varchar(20), c char(10));
GO

INSERT INTO t1 values ('94.564', '-12.1246', '32.22');
GO
INSERT INTO t1 values ('-94.564', '12.1246', '-32.22');
GO
INSERT INTO t1 values ('0', '0', '0');
GO
CREATE TABLE t2 (n1 numeric(3,1), n2 numeric(3,1), n3 numeric(3,1));
GO
INSERT INTO t2 SELECT * from t1;
GO
SELECT * FROM t2;
GO

-- String -> int2/int4/int8
CREATE TABLE t3 (a text, b varchar(20), c char(10));
GO

INSERT INTO t3 values ('12', '1234', '5431');
GO
INSERT INTO t3 values ('0', '0', '0');
GO
INSERT INTO t3 values ('-12', '-1234', '-5431');
GO
-- int2
CREATE TABLE t4 (si1 smallint, si2 smallint, si3 smallint);
GO
INSERT INTO t4 SELECT * from t3;
GO
select * from t4;
GO
-- int4
CREATE TABLE t5 (i1 int, i2 int, i3 int);
GO
INSERT INTO t5 SELECT * from t3;
GO
select * from t5;
GO
-- int8
CREATE TABLE t6 (bi1 bigint, bi2 bigint, bi3 bigint);
GO
INSERT INTO t6 SELECT * from t3;
GO
select * from t6;
GO

-- String -> float,fixeddecimal
CREATE TABLE t7 (a text, b varchar(20), c char(10));
GO

INSERT INTO t7 values ('11.23456', '12.34234', '60.54314');
GO
INSERT INTO t7 values ('0', '0', '0');
GO
INSERT INTO t7 values ('-12.01233', '-19.2346', '-43.88641');
GO
-- real (=float4)
CREATE TABLE t8 (f1 real, f2 real, f3 real);
GO
INSERT INTO t8 SELECT * from t7;
GO
select * from t8;
GO
-- float (=float(53) =double precision)
CREATE TABLE t9 (f1 float, f2 float, f3 float);
GO
INSERT INTO t9 SELECT * from t7;
GO
select * from t9;
GO
-- smallmoney
CREATE TABLE t10 (sm1 smallmoney, sm2 smallmoney, sm3 smallmoney);
GO
INSERT INTO t10 SELECT * from t7;
GO
select * from t10;
GO
-- money
CREATE TABLE t11 (m1 money, m2 money, m3 money);
GO
INSERT INTO t11 SELECT * from t7;
GO
select * from t11;
GO


-- Numeric types to string types
-- numeric types -> text
CREATE TABLE t12 (si smallint, i int, bi bigint, f real, f8 float, n numeric(4,2), sm smallmoney, m money);
GO

INSERT INTO t12 values (12, 4553, 123456, 12.345, 2344.456, 12.34, 456.3334, 1123.6777);
GO
INSERT INTO t12 values (-12, -1234, -123456, -12.345, -2344.456, 12.34, -456.3334, -1123.6777);
GO
INSERT INTO t12 values (0, 0, 0, 0, 0, 0, 0, 0);
GO
CREATE TABLE t13 (txt1 text,txt2 text,txt3 text,txt4 text,txt5 text,txt6 text,txt7 text,txt8 text);
GO
INSERT INTO t13 SELECT * from t12;
GO
SELECT * FROM t13;
GO
-- numeric types -> varchar(20)
CREATE TABLE t14 (v1 varchar(20),v2 varchar(20),v3 varchar(20),v4 varchar(20),v5 varchar(20),v6 varchar(20),v7 varchar(20),v8 varchar(20));
GO
INSERT INTO t14 SELECT * from t12;
GO
SELECT * FROM t14;
GO
-- numeric types -> char(10)
CREATE TABLE t15 (c1 char(20),c2 char(20),c3 char(20),c4 char(20),c5 char(20),c6 char(20),c7 char(20),c8 char(20));
GO
INSERT INTO t15 SELECT * from t12;
GO
SELECT * FROM t15;
GO

-- functions
select upper(cast (1 as smallint)), upper(cast (1 as int)), upper(cast (1 as bigint)), upper(cast (1 as real)), upper(cast (1 as float)), upper(cast (2.1 as numeric(2,1))), upper(cast (1 as smallmoney)), upper(cast (1 as money));
GO
select round(cast ('123' as text), 1), round(cast ('123' as char(3)), 1), round(cast ('123' as varchar(3)), 1);
GO

DROP TABLE t1;
GO
DROP TABLE t2;
GO
DROP TABLE t3;
GO
DROP TABLE t4;
GO
DROP TABLE t5;
GO
DROP TABLE t6;
GO
DROP TABLE t7;
GO
DROP TABLE t8;
GO
DROP TABLE t9;
GO
DROP TABLE t10;
GO
DROP TABLE t11;
GO
DROP TABLE t12;
GO
DROP TABLE t13;
GO
DROP TABLE t14;
GO
DROP TABLE t15;
GO
