//
//  SwiftMySQLTest.swift
//  SwiftMySQL
//
//  Created by Douglas Ward on 11/19/15.
//  Copyright © 2015 ArkPhone LLC. All rights reserved.
//

import Cocoa

import mysql

@objc class SwiftMySQLTest: NSObject
{
    var mysql_connection: UnsafeMutablePointer<MYSQL>! = nil

    override init()
    {
        super.init()
    }

    func mysqlTest()
    {
        let lib_result = mysql_server_init(0, nil, nil)

        if (lib_result == 1)
        {
            print("MySQL Client Library initialization failed")
            NSApplication.sharedApplication().terminate(self)
        }

        let thread_result = mysql_thread_init()
        print("mysql_thread_init result = \(thread_result)")

        mysql_connection = mysql_init(nil)
       
        let mysqlServerIPString = "localhost"
        let mysqlServerPortOrSocketString = "/Applications/MAMP/tmp/mysql/mysql.sock"
        let mysqlServerUserString = "root"
        let mysqlServerPasswordString =  "root"
        
        var mysqlPortInteger = UInt32(mysqlServerPortOrSocketString)
        var mysqlSocketString : String? = nil

        if (mysqlPortInteger == nil)
        {
            // if a port number was not specified, assume a socket connection
            mysqlSocketString = mysqlServerPortOrSocketString
            mysqlPortInteger = 0
        }
        
        mysql_connection = mysql_real_connect(mysql_connection!,
                mysqlServerIPString,
                mysqlServerUserString,
                mysqlServerPasswordString,
                nil,
                mysqlPortInteger!,
                mysqlSocketString!,
                CLIENT_MULTI_STATEMENTS)
       
        if (mysql_connection! != nil)
        {
            mysql_set_character_set(mysql_connection, "utf8")

            let showDatabasesString = "SHOW DATABASES"  // test your MySQL query here
            
            let mysql_show_result = mysql_query(mysql_connection!, showDatabasesString)

            if (mysql_show_result == 0)
            {
                let mysqlResult: UnsafeMutablePointer<MYSQL_RES> = mysql_store_result(mysql_connection)
                
                var row = mysql_fetch_row(mysqlResult)

                while (row != nil)
                {
                    let aRow = row[0]
                    
                    let aDatabaseName = NSString(CString:aRow, encoding:NSUTF8StringEncoding)
                    
                    print("Database name: \(aDatabaseName!)")
                    
                    row = mysql_fetch_row(mysqlResult)
                }
            }
            
            mysql_close(mysql_connection)
            mysql_connection = nil
        }
    }
}
