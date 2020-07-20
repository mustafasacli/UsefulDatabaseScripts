SELECT IST.TABLE_SCHEMA, ISC.TABLE_NAME, ISC.COLUMN_NAME, ISC.ORDINAL_POSITION, ISC.DATA_TYPE,
                            CASE ISC.IS_NULLABLE
                            WHEN 'NO' THEN 1
                            ELSE 0 END
                            AS IS_REQUIRED,
                            ISC.COLUMN_DEFAULT, -- AS DEFAULT_VALUE,
                            ISC.CHARACTER_MAXIMUM_LENGTH,-- AS MAXIMUM_LENGTH,
                            ISC.AUTOINC_INCREMENT AS IS_IDENTITY,
                            CASE ISC.DATA_TYPE
                            WHEN 'int' THEN ISC.NUMERIC_PRECISION
                            WHEN 'datetime' THEN ISC.DATETIME_PRECISION
                            WHEN 'datetime2' THEN ISC.DATETIME_PRECISION
                            WHEN 'date' THEN ISC.DATETIME_PRECISION
                            WHEN 'smalldatetime' THEN ISC.DATETIME_PRECISION
                            WHEN 'datetimeoffset' THEN ISC.DATETIME_PRECISION
                            WHEN 'time' THEN ISC.DATETIME_PRECISION
                            WHEN 'text' THEN 0
                            WHEN 'varchar' THEN 0
                            WHEN 'nvarchar' THEN 0
                            WHEN 'char' THEN 0
                            WHEN 'nchar' THEN 0
                            ELSE ISC.NUMERIC_PRECISION END
                             AS NUMERIC_PRECISION,
                            ISC.NUMERIC_SCALE
                            FROM INFORMATION_SCHEMA.COLUMNS ISC INNER JOIN INFORMATION_SCHEMA.TABLES IST
                            ON ISC.TABLE_NAME = IST.TABLE_NAME
                            WHERE IST.TABLE_TYPE = 'TABLE' AND ISC.TABLE_NAME <> 'sysdiagrams'
                            ORDER BY ISC.TABLE_CATALOG, ISC.TABLE_NAME, ISC.ORDINAL_POSITION;
