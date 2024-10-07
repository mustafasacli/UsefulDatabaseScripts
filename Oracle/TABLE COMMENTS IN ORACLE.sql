select * from all_tab_comments where substr(table_name,1,4) != 'BIN$';

select * from user_tab_comments where substr(table_name,1,4) != 'BIN$' AND COMMENTS IS NOT NULL AND TABLE_TYPE='TABLE'
ORDER BY TABLE_NAME;


SELECT 'COMMENT ON TABLE #SCHEMA_NAME#.'|| CM.TABLE_NAME ||' IS ''' ||CM.COMMENTS ||''';' AS QUERY, CM.* from user_tab_comments CM
where substr(CM.TABLE_NAME,1,4) != 'BIN$' AND CM.COMMENTS IS NOT NULL AND CM.TABLE_TYPE='TABLE'
ORDER BY CM.TABLE_NAME;