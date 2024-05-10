
--1.List all active sessions and its queries that contain your target table name or specific TSQL structure (input your target key word)

SELECT sqltext.TEXT,

req.session_id,

req.status,

req.command,

req.cpu_time,req.database_id,

req.total_elapsed_time

FROM sys.dm_exec_requests req

CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS sqltext 

where sqltext.text like '%tableName%'