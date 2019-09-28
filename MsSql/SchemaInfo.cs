https://docs.microsoft.com/en-us/dotnet/api/system.data.sqlclient.sqlconnection.getschema?redirectedfrom=MSDN&view=netframework-4.8#System_Data_SqlClient_SqlConnection_GetSchema

** Database;

USE [master]  
GO  

CREATE DATABASE [MySchool]   

GO  

USE [MySchool]  
GO  

SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  
CREATE TABLE [dbo].[Course]([CourseID] [nvarchar](10) NOT NULL,  
[Year] [smallint] NOT NULL,  
[Title] [nvarchar](100) NOT NULL,  
[Credits] [int] NOT NULL,  
[DepartmentID] [int] NOT NULL,  
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED   
(  
[CourseID] ASC,  
[Year] ASC  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]  

GO  

SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  
CREATE TABLE [dbo].[Department]([DepartmentID] [int] IDENTITY(1,1) NOT NULL,  
[Name] [nvarchar](50) NOT NULL,  
[Budget] [money] NOT NULL,  
[StartDate] [datetime] NOT NULL,  
[Administrator] [int] NULL,  
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED   
(  
[DepartmentID] ASC  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]  

GO  

INSERT [dbo].[Course] ([CourseID], [Year], [Title], [Credits], [DepartmentID]) VALUES (N'C1045', 2012, N'Calculus', 4, 7)  
INSERT [dbo].[Course] ([CourseID], [Year], [Title], [Credits], [DepartmentID]) VALUES (N'C1061', 2012, N'Physics', 4, 1)  
INSERT [dbo].[Course] ([CourseID], [Year], [Title], [Credits], [DepartmentID]) VALUES (N'C2021', 2012, N'Composition', 3, 2)  
INSERT [dbo].[Course] ([CourseID], [Year], [Title], [Credits], [DepartmentID]) VALUES (N'C2042', 2012, N'Literature', 4, 2)  

SET IDENTITY_INSERT [dbo].[Department] ON   

INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [Administrator]) VALUES (1, N'Engineering', 350000.0000, CAST(0x0000999C00000000 AS DateTime), 2)  
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [Administrator]) VALUES (2, N'English', 120000.0000, CAST(0x0000999C00000000 AS DateTime), 6)  
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [Administrator]) VALUES (4, N'Economics', 200000.0000, CAST(0x0000999C00000000 AS DateTime), 4)  
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [Administrator]) VALUES (7, N'Mathematics', 250024.0000, CAST(0x0000999C00000000 AS DateTime), 3)  
SET IDENTITY_INSERT [dbo].[Department] OFF  

ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DepartmentID])  
REFERENCES [dbo].[Department] ([DepartmentID])  
GO  
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]  
GO  

** C# Code;
using System;  
using System.Data;  
using System.Data.SqlClient;  

class Program {  
   static void Main(string[] args) {  

      using (SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=MySchool;Integrated Security=True;Asynchronous Processing=true;")) {  
         conn.Open();  

         // Get the Meta Data for Supported Schema Collections  
         DataTable metaDataTable = conn.GetSchema("MetaDataCollections");  

         Console.WriteLine("Meta Data for Supported Schema Collections:");  
         ShowDataTable(metaDataTable, 25);  
         Console.WriteLine();  

         // Get the schema information of Databases in your instance  
         DataTable databasesSchemaTable = conn.GetSchema("Databases");  

         Console.WriteLine("Schema Information of Databases:");  
         ShowDataTable(databasesSchemaTable, 25);  
         Console.WriteLine();  

         // First, get schema information of all the tables in current database;  
         DataTable allTablesSchemaTable = conn.GetSchema("Tables");  

         Console.WriteLine("Schema Information of All Tables:");  
         ShowDataTable(allTablesSchemaTable, 20);  
         Console.WriteLine();  

         // You can specify the Catalog, Schema, Table Name, Table Type to get   
         // the specified table(s).  
         // You can use four restrictions for Table, so you should create a 4 members array.  
         String[] tableRestrictions = new String[4];  

         // For the array, 0-member represents Catalog; 1-member represents Schema;   
         // 2-member represents Table Name; 3-member represents Table Type.   
         // Now we specify the Table Name of the table what we want to get schema information.  
         tableRestrictions[2] = "Course";  

         DataTable courseTableSchemaTable = conn.GetSchema("Tables", tableRestrictions);  

         Console.WriteLine("Schema Information of Course Tables:");  
         ShowDataTable(courseTableSchemaTable, 20);  
         Console.WriteLine();  

         // First, get schema information of all the columns in current database.  
         DataTable allColumnsSchemaTable = conn.GetSchema("Columns");  

         Console.WriteLine("Schema Information of All Columns:");  
         ShowColumns(allColumnsSchemaTable);  
         Console.WriteLine();  

         // You can specify the Catalog, Schema, Table Name, Column Name to get the specified column(s).  
         // You can use four restrictions for Column, so you should create a 4 members array.  
         String[] columnRestrictions = new String[4];  

         // For the array, 0-member represents Catalog; 1-member represents Schema;   
         // 2-member represents Table Name; 3-member represents Column Name.   
         // Now we specify the Table_Name and Column_Name of the columns what we want to get schema information.  
         columnRestrictions[2] = "Course";  
         columnRestrictions[3] = "DepartmentID";  

         DataTable departmentIDSchemaTable = conn.GetSchema("Columns", columnRestrictions);  

         Console.WriteLine("Schema Information of DepartmentID Column in Course Table:");  
         ShowColumns(departmentIDSchemaTable);  
         Console.WriteLine();  

         // First, get schema information of all the IndexColumns in current database  
         DataTable allIndexColumnsSchemaTable = conn.GetSchema("IndexColumns");  

         Console.WriteLine("Schema Information of All IndexColumns:");  
         ShowIndexColumns(allIndexColumnsSchemaTable);  
         Console.WriteLine();  

         // You can specify the Catalog, Schema, Table Name, Constraint Name, Column Name to   
         // get the specified column(s).  
         // You can use five restrictions for Column, so you should create a 5 members array.  
         String[] indexColumnsRestrictions = new String[5];  

         // For the array, 0-member represents Catalog; 1-member represents Schema;   
         // 2-member represents Table Name; 3-member represents Constraint Name;4-member represents Column Name.   
         // Now we specify the Table_Name and Column_Name of the columns what we want to get schema information.  
         indexColumnsRestrictions[2] = "Course";  
         indexColumnsRestrictions[4] = "CourseID";  

         DataTable courseIdIndexSchemaTable = conn.GetSchema("IndexColumns", indexColumnsRestrictions);  

         Console.WriteLine("Index Schema Information of CourseID Column in Course Table:");  
         ShowIndexColumns(courseIdIndexSchemaTable);  
         Console.WriteLine();  
      }  

      Console.WriteLine("Please press any key to exit...");  
      Console.ReadKey();  
   }  

   private static void ShowDataTable(DataTable table, Int32 length) {  
      foreach (DataColumn col in table.Columns) {  
         Console.Write("{0,-" + length + "}", col.ColumnName);  
      }  
      Console.WriteLine();  

      foreach (DataRow row in table.Rows) {  
         foreach (DataColumn col in table.Columns) {  
            if (col.DataType.Equals(typeof(DateTime)))  
               Console.Write("{0,-" + length + ":d}", row[col]);  
            else if (col.DataType.Equals(typeof(Decimal)))  
               Console.Write("{0,-" + length + ":C}", row[col]);  
            else  
               Console.Write("{0,-" + length + "}", row[col]);  
         }  
         Console.WriteLine();  
      }  
   }  

   private static void ShowDataTable(DataTable table) {  
      ShowDataTable(table, 14);  
   }  

   private static void ShowColumns(DataTable columnsTable) {  
      var selectedRows = from info in columnsTable.AsEnumerable()  
                         select new {  
                            TableCatalog = info["TABLE_CATALOG"],  
                            TableSchema = info["TABLE_SCHEMA"],  
                            TableName = info["TABLE_NAME"],  
                            ColumnName = info["COLUMN_NAME"],  
                            DataType = info["DATA_TYPE"]  
                         };  

      Console.WriteLine("{0,-15}{1,-15}{2,-15}{3,-15}{4,-15}", "TableCatalog", "TABLE_SCHEMA",  
          "TABLE_NAME", "COLUMN_NAME", "DATA_TYPE");  
      foreach (var row in selectedRows) {  
         Console.WriteLine("{0,-15}{1,-15}{2,-15}{3,-15}{4,-15}", row.TableCatalog,  
             row.TableSchema, row.TableName, row.ColumnName, row.DataType);  
      }  
   }  

   private static void ShowIndexColumns(DataTable indexColumnsTable) {  
      var selectedRows = from info in indexColumnsTable.AsEnumerable()  
                         select new {  
                            TableSchema = info["table_schema"],  
                            TableName = info["table_name"],  
                            ColumnName = info["column_name"],  
                            ConstraintSchema = info["constraint_schema"],  
                            ConstraintName = info["constraint_name"],  
                            KeyType = info["KeyType"]  
                         };  

      Console.WriteLine("{0,-14}{1,-11}{2,-14}{3,-18}{4,-16}{5,-8}", "table_schema", "table_name", "column_name", "constraint_schema", "constraint_name", "KeyType");  
      foreach (var row in selectedRows) {  
         Console.WriteLine("{0,-14}{1,-11}{2,-14}{3,-18}{4,-16}{5,-8}", row.TableSchema,  
             row.TableName, row.ColumnName, row.ConstraintSchema, row.ConstraintName, row.KeyType);  
      }  
   }  
}  
