-- This file contains test cases to test un-mapped runtime error against Babelfish server.
GO

CREATE SCHEMA error_mapping;
GO

-- Example 1
GO

CREATE TABLE t257(c1 binary(10));
GO
DECLARE @a binary(10); 
SET @a = CAST('21' AS char(10));
SELECT @a
GO
DROP TABLE t257;
GO

begin transaction
GO
--Pre
CREATE TABLE t257(c1 binary(10));
GO

DECLARE @a binary(10); 
SET @a = CAST('21' AS char(10));
SELECT @a
GO

if (@@trancount > 0) select cast('txn is not rolledback' as text) else select cast('txn is rolledback' as text)
GO

if (@@trancount > 0) rollback tran
GO

DROP TABLE t257;
GO

SET XACT_ABORT ON;
GO

begin transaction
GO
--Pre
CREATE TABLE t257(c1 binary(10));
GO

DECLARE @a binary(10); 
SET @a = CAST('21' AS char(10));
SELECT @a
GO

if (@@trancount > 0) select cast('txn is not rolledback' as text) else select cast('txn is rolledback' as text)
GO

if (@@trancount > 0) rollback tran
GO

DROP TABLE t257;
GO

SET XACT_ABORT OFF;
GO


CREATE TABLE t257(c1 binary(10));
GO

create procedure error_mapping.ErrorHandling1 as
begin
	begin try
		select 1
		DECLARE @a binary(10); 
		SET @a = CAST('21' AS char(10));
		SELECT @a
	end try
	begin catch
		select xact_state();
	end catch
	select @@trancount;
end
GO

if @@error > 0 select cast('Compile time error' as text);
GO

begin transaction;
GO

exec error_mapping.ErrorHandling1;
GO

if @@trancount > 0 select cast('Txn is not rolledback')
GO

if @@trancount > 0 rollback transaction;
GO


set xact_abort ON;
GO

exec error_mapping.ErrorHandling1;
GO

if @@trancount > 0 select cast('Txn is not rolledback')
GO

if @@trancount > 0 rollback transaction;
GO

set xact_abort OFF;
GO

drop procedure error_mapping.ErrorHandling1;
GO

DROP TABLE t257;
GO

-- Example 2
GO

SELECT DATEPART(xyz, CAST('2012-12-12' AS date));
GO

begin transaction
GO

SELECT DATEPART(xyz, CAST('2012-12-12' AS date));
GO

if (@@trancount > 0) select cast('txn is not rolledback' as text) else select cast('txn is rolledback' as text)
GO

if (@@trancount > 0) rollback tran
GO

SET XACT_ABORT ON;
GO

begin transaction
GO

SELECT DATEPART(xyz, CAST('2012-12-12' AS date));
GO

if (@@trancount > 0) select cast('txn is not rolledback' as text) else select cast('txn is rolledback' as text)
GO

if (@@trancount > 0) rollback tran
GO

SET XACT_ABORT OFF;
GO

create procedure error_mapping.ErrorHandling1 as
begin
	begin try
		select 1
		SELECT DATEPART(xyz, CAST('2012-12-12' AS date));
	end try
	begin catch
		select xact_state();
	end catch
	select @@trancount;
end
GO

if @@error > 0 select cast('Compile time error' as text)
GO

begin transaction;
GO

exec error_mapping.ErrorHandling1;
GO

if @@trancount > 0 select cast('txn is not rolledback' as text)
GO

if @@trancount > 0 rollback tran;
GO

set xact_abort ON;
GO

begin transaction;
GO

exec error_mapping.ErrorHandling1;
GO

if @@trancount > 0 select cast('txn is not rolledback' as text)
GO

if @@trancount > 0 rollback tran;
GO

set xact_abort OFF;
GO

drop procedure error_mapping.ErrorHandling1;
GO

DROP SCHEMA error_mapping;
GO