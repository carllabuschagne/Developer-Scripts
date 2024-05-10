
--2.List all sleeping user sessions that have been idle for over 15 minutes with detailed queries (You can customize the session’s status and idle time)

SELECT 
	CURRENT_TIMESTAMP as currenttime, 
	datediff(minute,last_batch,GETDATE()) as 'idletime_in_minute',
	sp.status,
	sp.spid,
	sp.login_time,
	sp.program_name,
	sp.hostprocess,
	sp.loginame,
	text 
FROM 
	sys.sysprocesses sp CROSS APPLY 
	sys.dm_exec_sql_text(sp.sql_handle) AS QT 
where 
	sp.status = 'sleeping' and 
	datediff(minute,last_batch,GETDATE()) > 15 and 
	spid > 50