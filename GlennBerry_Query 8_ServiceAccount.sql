-- Tells you the account being used for the SQL Server Service and the SQL Agent Service
-- Shows the process_id, when they were last started, and their current status
-- Also shows whether you are running on a failover cluster instance, and what node you are running on
-- Also shows whether IFI is enabled

-- sys.dm_server_services (Transact-SQL)
-- https://bit.ly/2oKa1Un


-- Last backup information by database  (Query 8) (Last Backup By Database)
SELECT ISNULL(d.[name], bs.[database_name]) AS [Database], d.recovery_model_desc AS [Recovery Model], 
       d.log_reuse_wait_desc AS [Log Reuse Wait Desc],
    MAX(CASE WHEN [type] = 'D' THEN bs.backup_finish_date ELSE NULL END) AS [Last Full Backup],
    MAX(CASE WHEN [type] = 'I' THEN bs.backup_finish_date ELSE NULL END) AS [Last Differential Backup],
    MAX(CASE WHEN [type] = 'L' THEN bs.backup_finish_date ELSE NULL END) AS [Last Log Backup]
FROM sys.databases AS d WITH (NOLOCK)
LEFT OUTER JOIN msdb.dbo.backupset AS bs WITH (NOLOCK)
ON bs.[database_name] = d.[name] 
AND bs.backup_finish_date > GETDATE()- 30
WHERE d.name <> N'tempdb'
GROUP BY ISNULL(d.[name], bs.[database_name]), d.recovery_model_desc, d.log_reuse_wait_desc, d.[name] 
ORDER BY d.recovery_model_desc, d.[name] OPTION (RECOMPILE);
