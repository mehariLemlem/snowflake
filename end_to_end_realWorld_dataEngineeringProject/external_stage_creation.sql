-- Create storage integration to ADLS
-- A storage integration is a secure object that connects Snowflake to external cloud storage
CREATE OR REPLACE STORAGE INTEGRATION <integration_name>
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = AZURE
  ENABLED = TRUE
  AZURE_TENANT_ID = 'tenant_id'
  STORAGE_ALLOWED_LOCATIONS = ('azure://<storage_acct>.blob.core.windows.net/<container>/');

-- Show me the configuration details of the storage integration (It returns metadata about the integration)
DESC STORAGE INTEGRATION <integration_name>;
    /*
    AZURE_CONSENT_URL:
        - is a Microsoft Entra (Azure AD) consent link that an Azure administrator must open to grant Snowflake permission to access Azure storage
        - Opens an Azure permission screen
        - Lets an admin approve Snowflake as an application
        - Allows access to Azure storage without passwords or shared keys

    AZURE_MULTI_TENANT_APP_NAME:
        - It is the name of the Azure (Entra ID) application registered by Snowflake that enables secure access to your Azure storage account.
        - It identifies the application identity Snowflake uses inside Microsoft Entra ID (Azure AD) to authenticate.
    */


-- Grant read/writ access permission to an application (AZURE_MULTI_TENANT_APP_NAME)
-- Storage account → Access control (IAM) → Add → Role assignment → Storege blob data contributer → Select application → Review + Assign

-- Create snowflake DB
CREATE DATABASE IF NOT EXISTS <database_name>;

-- Create bronze schema:
CREATE SCHEMA IF NOT EXISTS <schema_name>;

-- Create stage (in order to create the stage we need to first create the database in snowflake)
USE <database_name>.<schema_name>
CREATE OR REPLACE STAGE <stage_name>
    STORAGE_INTEGRATION = <integration_name>
    URL = 'azure://<storage_acct>.blob.core.windows.net/<container>';

-- check the stage:
-- LS @stage is a command used to list files stored in a stage (a staging location for data files before loading or unloading data).
ls @<stage_name>