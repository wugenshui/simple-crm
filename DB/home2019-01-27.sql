DELETE CustomerOperate
/*
   2019年1月27日15:23:22
   用户: 
   服务器: .
   数据库: CRM
   应用程序: 
*/

/* 为了防止任何可能出现的数据丢失问题，您应该先仔细检查此脚本，然后再在数据库设计器的上下文之外运行此脚本。*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_CustomerOperate
	(
	Id int NOT NULL IDENTITY (1, 1),
	CustomerId int NOT NULL,
	CustomerName nvarchar(50) NOT NULL,
	OperatorId int NOT NULL,
	OperatorName nvarchar(50) NOT NULL,
	State int NOT NULL,
	Remark varchar(250) NOT NULL,
	OperatorTime datetime NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_CustomerOperate SET (LOCK_ESCALATION = TABLE)
GO
DECLARE @v sql_variant 
SET @v = N'顾客ID'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CustomerOperate', N'COLUMN', N'CustomerId'
GO
DECLARE @v sql_variant 
SET @v = N'顾客姓名'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CustomerOperate', N'COLUMN', N'CustomerName'
GO
DECLARE @v sql_variant 
SET @v = N'操作人ID'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CustomerOperate', N'COLUMN', N'OperatorId'
GO
DECLARE @v sql_variant 
SET @v = N'操作人姓名'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CustomerOperate', N'COLUMN', N'OperatorName'
GO
DECLARE @v sql_variant 
SET @v = N'状态'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CustomerOperate', N'COLUMN', N'State'
GO
DECLARE @v sql_variant 
SET @v = N'备注'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CustomerOperate', N'COLUMN', N'Remark'
GO
DECLARE @v sql_variant 
SET @v = N'创建时间'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CustomerOperate', N'COLUMN', N'OperatorTime'
GO
ALTER TABLE dbo.Tmp_CustomerOperate ADD CONSTRAINT
	DF_CustomerOperate_CustomerId DEFAULT 0 FOR CustomerId
GO
ALTER TABLE dbo.Tmp_CustomerOperate ADD CONSTRAINT
	DF_CustomerOperate_CustomerName DEFAULT '' FOR CustomerName
GO
ALTER TABLE dbo.Tmp_CustomerOperate ADD CONSTRAINT
	DF_CustomerOperate_OperatorName DEFAULT '' FOR OperatorName
GO
ALTER TABLE dbo.Tmp_CustomerOperate ADD CONSTRAINT
	DF_CustomerOperate_State DEFAULT 0 FOR State
GO
ALTER TABLE dbo.Tmp_CustomerOperate ADD CONSTRAINT
	DF_CustomerOperate_Remark DEFAULT '' FOR Remark
GO
SET IDENTITY_INSERT dbo.Tmp_CustomerOperate ON
GO
IF EXISTS(SELECT * FROM dbo.CustomerOperate)
	 EXEC('INSERT INTO dbo.Tmp_CustomerOperate (Id, CustomerId, OperatorId, State, Remark, OperatorTime)
		SELECT Id, CONVERT(int, CustomerId), CONVERT(int, OperatorId), CONVERT(int, State), Remark, OperatorTime FROM dbo.CustomerOperate WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_CustomerOperate OFF
GO
DROP TABLE dbo.CustomerOperate
GO
EXECUTE sp_rename N'dbo.Tmp_CustomerOperate', N'CustomerOperate', 'OBJECT' 
GO
ALTER TABLE dbo.CustomerOperate ADD CONSTRAINT
	PK_CustomerLog PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
