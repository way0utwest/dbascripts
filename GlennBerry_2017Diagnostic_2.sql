SELECT 'Glenn Berry Diagnostic Query 1 - Instant Config Values'

-- Get instance-level configuration values for instance  (Query 4) (Configuration Values)
SELECT name, value, value_in_use, minimum, maximum, [description], is_dynamic, is_advanced
FROM sys.configurations WITH (NOLOCK)
ORDER BY name OPTION (RECOMPILE);