use auth_dev;

----------- Delete Tables ---------------
DROP TABLE IF EXISTS FILE_DOWNLOAD;
DROP TABLE IF EXISTS ARTICLE_TYPE;
DROP TABLE IF EXISTS TEMPLATE_NAME;
DROP TABLE IF EXISTS TEMPLATE_TYPE;
----------- Delete Tables ---------------

----------- Create Tables ---------------
CREATE TABLE TEMPLATE_TYPE (
	ID INT AUTO_INCREMENT, 
	NAME VARCHAR(255),
	DESCRIPTION VARCHAR(255),
	STATUS VARCHAR(10),
	CREATED_BY VARCHAR(20), 
	CREATED_DATE DATETIME, 
	MODIFIED_BY VARCHAR(20), 
	MODIFIED_DATE DATETIME, 
	PRIMARY KEY (ID),
    UNIQUE (NAME)
);

CREATE TABLE TEMPLATE_NAME (
	ID INT AUTO_INCREMENT,
	NAME VARCHAR(255),
	ACRONYM VARCHAR(20),
	DESCRIPTION VARCHAR(255), 
	STATUS VARCHAR(10),
	CREATED_BY VARCHAR(20), 
	CREATED_DATE DATETIME, 
	MODIFIED_BY VARCHAR(20), 
	MODIFIED_DATE DATETIME, 
	TEMPLATE_TYPE_ID INT, 
	PRIMARY KEY (ID),
	FOREIGN KEY (TEMPLATE_TYPE_ID) REFERENCES TEMPLATE_TYPE(ID),
    UNIQUE (TEMPLATE_TYPE_ID, NAME)
);

CREATE TABLE ARTICLE_TYPE (
	ID INT AUTO_INCREMENT, 
	NAME VARCHAR(255),
	DESCRIPTION VARCHAR(255),
	STATUS VARCHAR(10),
	CREATED_BY VARCHAR(20), 
	CREATED_DATE DATETIME, 
	MODIFIED_BY VARCHAR(20), 
	MODIFIED_DATE DATETIME, 
	TEMPLATE_NAME_ID INT, 
	PRIMARY KEY (ID),
	FOREIGN KEY (TEMPLATE_NAME_ID) REFERENCES TEMPLATE_NAME(ID),
    UNIQUE (TEMPLATE_NAME_ID, NAME)
);

CREATE TABLE FILE_DOWNLOAD (
	ID INT AUTO_INCREMENT, 
	FORMAT VARCHAR(30), 
	URL VARCHAR(255), 
	DESCRIPTIVE_TEXT VARCHAR(255),
	TEMPLATE_TYPE_ID INT, 
	TEMPLATE_NAME_ID INT, 
	ARTICLE_TYPE_ID INT, 
	PRIMARY KEY (ID),
	FOREIGN KEY (TEMPLATE_TYPE_ID) REFERENCES TEMPLATE_TYPE(ID),
	FOREIGN KEY (TEMPLATE_NAME_ID) REFERENCES TEMPLATE_NAME(ID),
	FOREIGN KEY (ARTICLE_TYPE_ID) REFERENCES ARTICLE_TYPE(ID)
);
----------- Create Tables ---------------