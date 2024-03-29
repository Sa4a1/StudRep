use ProjectOranizationDB
CREATE TABLE [dbo].[Gender] (
    GenderCode CHAR(1) PRIMARY KEY 
        CHECK (GenderCode IN ('ì', 'æ')),
    GenderName VARCHAR(50) NOT NULL
);