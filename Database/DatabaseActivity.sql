
SELECT
	[Spid] = sp.session_Id
	, er.request_id
	, er.command
	, [Database] = DB_NAME(er.database_id)
	, [User] = login_name
	, er.blocking_session_id
	, [Status] = er.status
	, [Wait] = wait_type
	, CAST('<?query --'+CHAR(13)+SUBSTRING(qt.text,
	(er.statement_start_offset / 2)+1,     ((CASE er.statement_end_offset
	WHEN -1 THEN DATALENGTH(qt.text)    ELSE er.statement_end_offset
	END - er.statement_start_offset)/2) + 1)+CHAR(13)+'--?>' AS xml) as sql_statement
	, [Parent Query] = qt.text
	--,p.query_plan
	, er.cpu_time
	, er.reads
	, er.writes
	, er.Logical_reads
	, er.row_count
	, Program = program_name
	, Host_name
	, start_time
FROM sys.dm_exec_requests er with (nolock) INNER JOIN sys.dm_exec_sessions sp with (nolock) ON er.session_id = sp.session_id
	OUTER APPLY sys.dm_exec_sql_text (er.sql_handle)  as qt 
	OUTER APPLY sys.dm_exec_query_plan(er.plan_handle) p
WHERE sp.is_user_process = 1
	/* sp.session_Id > 50
	-- Ignore system spids. -- */
	AND sp.session_Id NOT IN (@@SPID)

--ORDER BY 1, 2  
--ORDER BY host_name
ORDER by cpu_time desc