/*
=============================================================
Create DataWarehouse Database and Schemas
=============================================================
Purpose:
    This script creates the DataWarehouse database and sets up
    the bronze, silver, and gold schemas.

    If the DataWarehouse database already exists, it will be
    deleted and created again from the beginning.

WARNING:
    This script will delete the existing DataWarehouse database
    and all the data inside it.

    Make sure you have a backup before running this script if
    you need to keep the existing data.
*/

-- Switch to the master database
USE master;
GO

-- Check if the DataWarehouse database already exists
-- If it exists, close all connections and delete the database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create a new DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch to the DataWarehouse database
USE DataWarehouse;
GO

-- Create the bronze schema
-- Used for storing the raw data loaded from the source files
CREATE SCHEMA bronze;
GO

-- Create the silver schema
-- Used for cleaning and transforming the raw data
CREATE SCHEMA silver;
GO

-- Create the gold schema
-- Used for storing the final data ready for reporting and analysis
CREATE SCHEMA gold;
GO
