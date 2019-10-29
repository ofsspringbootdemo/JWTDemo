INSERT INTO TEMPLATE_TYPE (NAME, DESCRIPTION, STATUS, CREATED_BY, CREATED_DATE, MODIFIED_BY, MODIFIED_DATE) VALUES (
'Transactions, Journals and Letters', 'Template type to publish new Journal', 'Active', 'Admin', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP );

---------------- IEEE Access --------------------

INSERT INTO TEMPLATE_NAME (NAME, ACRONYM, DESCRIPTION, STATUS, CREATED_BY, CREATED_DATE, MODIFIED_BY, MODIFIED_DATE, TEMPLATE_TYPE_ID) VALUES (
'IEEE Access', 'ACCESS', 'Template type to publish new Journal', 'Active', 'Admin', CURRENT_TIMESTAMP , 'Admin', CURRENT_TIMESTAMP, 
(SELECT ID FROM TEMPLATE_TYPE WHERE NAME = 'Transactions, Journals and Letters'));

INSERT INTO ARTICLE_TYPE (NAME, DESCRIPTION, STATUS, CREATED_BY, CREATED_DATE, MODIFIED_BY, MODIFIED_DATE, TEMPLATE_NAME_ID) VALUES (
'Original research', 'Template type to publish new Journal', 'Active', 'Admin', CURRENT_TIMESTAMP , 'Admin', CURRENT_TIMESTAMP, 
(SELECT ID FROM TEMPLATE_NAME WHERE NAME = 'IEEE Access' AND TEMPLATE_TYPE_ID = (SELECT ID FROM TEMPLATE_TYPE WHERE NAME = 'Transactions, Journals and Letters')));
 
INSERT INTO FILE_DOWNLOAD (FORMAT, URL, DESCRIPTIVE_TEXT, ARTICLE_TYPE_ID) VALUES (
'Word', 'Access-Template.doc', 'Please use this template when writing an original research article for IEEE Access in Microsoft Word format.', 
(SELECT ID FROM ARTICLE_TYPE WHERE NAME = 'Original research' AND TEMPLATE_NAME_ID = (SELECT ID FROM TEMPLATE_NAME WHERE NAME = 'IEEE Access' AND TEMPLATE_TYPE_ID = (SELECT ID FROM TEMPLATE_TYPE WHERE NAME = 'Transactions, Journals and Letters'))));

INSERT INTO FILE_DOWNLOAD (FORMAT, URL, DESCRIPTIVE_TEXT,ARTICLE_TYPE_ID) VALUES (
'LaTeX', 'Access-Template.zip', 'Please use this template when writing an original research article for IEEE Access in LaTeX format.', 
(SELECT ID FROM ARTICLE_TYPE WHERE NAME = 'Original research' AND TEMPLATE_NAME_ID = (SELECT ID FROM TEMPLATE_NAME WHERE NAME = 'IEEE Access' AND TEMPLATE_TYPE_ID = (SELECT ID FROM TEMPLATE_TYPE WHERE NAME = 'Transactions, Journals and Letters'))));