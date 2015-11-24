# SwiftMySQL notes -

This project demonstrates the usage of Apple's new Swift language with the MySQL database server.  Currently, this project runs on a Mac, but hopefully it can be ported to Linux after Apple publishes the open-source version of Swift by the end of 2015.



Before building this project, please note these dependencies -



This code assumes MAMP.app is installed on Mac OS X and the MySQL server running.

MAMP.app is available here - http://www.mamp.info

or, change the connection values in the Swift code to match your MySQL configuration.



Also, it assumes that the MySQL API interfaces and libraries for OS X are installed at -

/usr/local/mysql/include

and

/usr/local/mysql/lib

The MySQL Connector/C (libmysqlclient) is available here -

http://dev.mysql.com/downloads/connector/c/

After installation, either rename the folder to match the /usr/local/mysql path, or create an alias at that location to point to the correct folder.



Finally, the MySQL APIs are imported into Swift as a module, where the header files are stored at /usr/local/mysql/include/mysql.h

If your MySQL headers are located elsewhere, edit the module.map file accordingly.


The reference manual for the MySQL C API is here -

[https://dev.mysql.com/doc/refman/5.7/en/c-api.html](https://dev.mysql.com/doc/refman/5.7/en/c-api.html)


For multi-threaded usage, see this page of the MySQL documentation -

[https://dev.mysql.com/doc/refman/5.7/en/c-api-threaded-clients.html](https://dev.mysql.com/doc/refman/5.7/en/c-api-threaded-clients.html)
