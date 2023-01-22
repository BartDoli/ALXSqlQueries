-- Creating a database
PRINT('Creating database')
CREATE DATABASE alx_course_db
PRINT('Creating database')
CREATE DATABASE alx_course_db1
GO

-- change database name
PRINT('Changing database name')
ALTER DATABASE alx_course_db MODIFY name = AlxCourseDB

-- stop executing
RETURN

-- deleting database
PRINT('Dropping database')
DROP DATABASE AlxCourseDB
PRINT('Dropping database')
DROP DATABASE alx_course_db1