
--Database Activity

SELECT
	[Spid] = sp.session_Id,
	er.request_id,
	er.command,
	[Database] = DB_NAME(er.database_id),
	[User] = login_name,
	er.blocking_session_id,
	[Status] = er.status,
	[Wait] = wait_type,
	CAST('<?query --'+CHAR(13)+SUBSTRING(qt.text,(er.statement_start_offset / 2)+1,((CASE er.statement_end_offset WHEN -1 THEN DATALENGTH(qt.text) ELSE er.statement_end_offset END - er.statement_start_offset)/2) + 1)+CHAR(13)+'--?>' AS xml) as sql_statement,
	[Parent Query] = qt.text,
	--p.query_plan,
	er.cpu_time,
	er.reads,
	er.writes,
	er.Logical_reads,
	er.row_count,
	Program = program_name,
	Host_name,
	start_time
FROM
	sys.dm_exec_requests er with (nolock) INNER JOIN
	sys.dm_exec_sessions sp with (nolock) ON er.session_id = sp.session_id OUTER APPLY 
	sys.dm_exec_sql_text (er.sql_handle)  as qt OUTER APPLY 
	sys.dm_exec_query_plan(er.plan_handle) p
WHERE 
	sp.is_user_process = 1
	/* sp.session_Id > 50
	-- Ignore system spids. -- */
	AND sp.session_Id NOT IN (@@SPID)
--ORDER BY 1, 2  
--ORDER BY host_name
ORDER by 
	cpu_time desc


--1.List all active sessions and its queries that contain your target table name or specific TSQL structure (input your target key word)

SELECT
	sqltext.TEXT,
	req.session_id,
	req.status,
	req.command,
	req.cpu_time,
	req.database_id,
	req.total_elapsed_time
FROM
	sys.dm_exec_requests req CROSS APPLY 
	sys.dm_exec_sql_text(sql_handle) AS sqltext
WHERE 
	sqltext.text LIKE '%tableName%'


--For currently executing statements, check total_elapsed_time and cpu_time columns in sys.dm_exec_requests. Run the following query to get the data:

SELECT
	req.session_id,
	req.total_elapsed_time AS duration_ms,
	req.cpu_time AS cpu_time_ms,
	req.total_elapsed_time - req.cpu_time AS wait_time,
	req.logical_reads,
	SUBSTRING (REPLACE (REPLACE (SUBSTRING (ST.text, (req.statement_start_offset/2) + 1, ((CASE statement_end_offset WHEN -1 THEN DATALENGTH(ST.text) ELSE req.statement_end_offset END - req.statement_start_offset)/2) + 1) , CHAR(10), ' '), CHAR(13), ' '), 1, 512)  AS statement_text
FROM
	sys.dm_exec_requests AS req CROSS APPLY 
	sys.dm_exec_sql_text(req.sql_handle) AS ST
ORDER BY 
	total_elapsed_time DESC;



--For past executions of the query, check last_elapsed_time and last_worker_time columns in sys.dm_exec_query_stats. Run the following query to get the data:

SELECT
	t.text,
	(qs.total_elapsed_time/1000) / qs.execution_count AS avg_elapsed_time,
	(qs.total_worker_time/1000) / qs.execution_count AS avg_cpu_time,
	((qs.total_elapsed_time/1000) / qs.execution_count ) - ((qs.total_worker_time/1000) / qs.execution_count) AS avg_wait_time,
	qs.total_logical_reads / qs.execution_count AS avg_logical_reads,
	qs.total_logical_writes / qs.execution_count AS avg_writes,
	(qs.total_elapsed_time/1000) AS cumulative_elapsed_time_all_executions
FROM
	sys.dm_exec_query_stats qs CROSS apply 
	sys.Dm_exec_sql_text (sql_handle) t
WHERE 
	t.text like '%rtmc%'
-- Replace <Your Query> with your query or the beginning part of your query. The special chars like '[','_','%','^' in the query should be escaped.
ORDER BY 
	(qs.total_elapsed_time / qs.execution_count) DESC
