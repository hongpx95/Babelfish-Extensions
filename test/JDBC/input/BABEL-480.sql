create procedure p_rcv3 as begin select 123 end
go

create procedure p_rcv12a
as
begin                -- begin + end lines are optional
select 'hello'
select 'world'
select '!!!'
end                  -- begin + end lines are optional
go

drop procedure p_rcv3
GO

drop procedure p_rcv12a
GO