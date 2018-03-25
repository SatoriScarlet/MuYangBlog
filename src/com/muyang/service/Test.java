package com.muyang.service;

import com.muyang.util.DBTool;

import java.sql.Array;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;

public class Test {
//    static{
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//    }

    public static void main(String[] args) {

        Connection con = DBTool.getCon();
        Statement sta = DBTool.getSta(con);

        DBTool.enterDatabase(sta,"user");
        ArrayList<Object> str = DBTool.getDate(sta,"userinfo","username 'a8515322'","passwd 'ppsbbos'");
        for (Object s : str)
        {
            System.out.println(s);
        }
        System.out.println(str);

        DBTool.close(sta);
        DBTool.close(con);



    }

}
