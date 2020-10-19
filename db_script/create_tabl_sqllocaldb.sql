
/****** Script FOR: SQL LOCAL DB ******/
/****** Script Date: 16-10-2020 15:00:00 ******/

/**CREATE CUSTOMER TABLE**/

CREATE TABLE [dbo].[customer](
	[customer_id] INT IDENTITY(1001, 1) NOT NULL,
	[first_name] [varchar](255) NULL,
	[last_name] [varchar](255) NULL,
	[phone_no] [varchar](255) NULL,
	[gender] [varchar](255) NULL,
CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([customer_id] ASC)
) ON [PRIMARY]

    
/** =====================================================================**/   

/**CREATE ADDRESS TABLE**/

CREATE TABLE [dbo].[address](
	[address_id] INT IDENTITY(101, 1) NOT NULL,
	[address_type] [varchar](255) NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](255) NULL,	
	[state] [varchar](255) NULL,
	[postal_code] [varchar](255) NULL,
	[customer_id] INT  NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED ([address_id] ASC)
) ON [PRIMARY]


ALTER TABLE [dbo].[address]     
ADD CONSTRAINT FK_id FOREIGN KEY (customer_id)     
    REFERENCES [dbo].[customer] (customer_id)     
    ON DELETE CASCADE    
    ON UPDATE CASCADE  
    
/** =====================================================================**/   
     
/** =====================================================================**/    
/** hibernate_sequence TABLE**/

CREATE TABLE [dbo].[hibernate_sequence](
	[next_val] [numeric] (1, 0) NULL
) ON [PRIMARY]

    
/** =====================================================================**/   

   
