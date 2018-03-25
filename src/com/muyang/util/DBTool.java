package com.muyang.util;

import com.sun.org.apache.regexp.internal.RE;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author MuYang
 * 这是一个用于获得数据库链接的工具包
 * 能用，应该。
 */

public class DBTool {

    public static final String VERSION = "V.1.3";

    public static boolean IsDebug = true;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    private static String DataBaseUrl = "jdbc:mysql://localhost:3306";
    private static String DataBaseUser = "root";
    private static String DataBasePassWord = "a8515322";
    /**
     * 这是一个用于取得数据库链接的静态方法，每调用一次都将返回单独的链接，
     *
     * @return Connection
     */

    public static Connection getCon()
    {
        try {
            Connection connection = DriverManager.getConnection(DataBaseUrl,DataBaseUser,DataBasePassWord);
            deBugMessage("已获得数据库链接");
            return connection;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            deBugMessage("无法链接数据库！");
            return null;

        }
    }

    /**
     * 这是一个用于取得数据库链接的静态方法，每调用一次都将返回单独的链接，
     * 可以传输想要进入的数据库的名字
     *
     * @return Connection
     */

    public static Connection getCon(String databaseName)
    {
        String TempDataBaseUrl = null;
        if(databaseName == null)
        {
            TempDataBaseUrl = DataBaseUrl;
        }
        else
        {
            TempDataBaseUrl = DataBaseUrl + "/" + databaseName;
        }

        try {
            Connection connection = DriverManager.getConnection(TempDataBaseUrl,DataBaseUser,DataBasePassWord);
            deBugMessage("已获得数据库链接");
            return connection;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            deBugMessage("无法链接数据库" + databaseName + "！");
            return null;
        }
    }

    /**
     * 这是一个用于取得数据库清单的信息。
     * 当调用此方法时，将返回给予的链接的清单
     *
     * @return Statement
     */

    public static Statement getSta(Connection connection)
    {
        try {
            Statement statement = connection.createStatement();
            deBugMessage("已获得数据库清单");
            return statement;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            deBugMessage("无法获得数据库清单");
            return null;

        }
    }

    /**
     * 这是一个输出测试模式的提示信息
     * 当IsDebug为true时，输出信息，否则不输出
     *
     * @param message
     * message为返回的测试信息
     *
     * @return Connection
     */

    private static void deBugMessage(String message)
    {
        if(IsDebug)
        System.out.println(VERSION + "：" + message);

    }

    /**
     * 此方法用于新建数据库
     *
     * @param statement
     * @param name
     * statement为清单实例
     * name为数据库名字
     */

    public static void createDatabase(Statement statement,String name)
    {
        deBugMessage("正在创建数据库 " + name);
        try {
            statement.execute("CREATE DATABASE IF NOT EXISTS " + name);

            deBugMessage("成功创建数据库 " + name);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            deBugMessage("创建数据库 " + name + "失败！");
        }
    }

    /**
     * 此方法用于删除数据库
     *
     * @param statement
     * @param name
     * statement为清单实例
     * name为数据库名字
     */

    public static void dropDatabase(Statement statement,String name)
    {
        deBugMessage("正在删除数据库 " + name);
        try {
            statement.execute("DROP DATABASE IF EXISTS " + name);

            deBugMessage("成功删除数据库 " + name);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            deBugMessage("删除数据库 " + name + "失败！");
        }
    }

    /**
     * 此方法用于删除表格
     *
     * @param statement
     * @param name
     * statement为清单实例
     * name为表格名字
     */

    public static void dropTable(Statement statement,String name)
    {
        deBugMessage("正在删除表格 " + name);
        try {
            statement.execute("DROP TABLE IF EXISTS " + name);

            deBugMessage("成功删除表格 " + name);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            deBugMessage("删除表格 " + name + "失败！");
        }
    }

    /**
     * 此方法用于查找数据库是否存在
     *
     * @param statement
     * @param name
     * statement为清单实例
     * name为数据库名字
     */

    public static boolean hasDatabase(Statement statement,String name)
    {
        deBugMessage("正在寻找数据库 " + name);
        try {
            ResultSet rs = statement.executeQuery("SHOW DATABASES");
            while (rs.next())
            {
                if(rs.getString(1).equals(name))
                {
                    deBugMessage("数据库 " + name + " 存在");
                    return true;
                }
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        deBugMessage("数据库 " + name + " 不存在");
        return false;
    }

    /**
     * 此方法用于查找表格是否存在
     *
     * @param statement
     * @param name
     * statement为清单实例
     * name为表格名字
     */

    public static boolean hasTable(Statement statement,String name)
    {
        deBugMessage("正在寻找数表格 " + name);
        try {
            ResultSet rs = statement.executeQuery("SHOW TABLES");
            while (rs.next())
            {
                if(rs.getString(1).equals(name))
                {
                    deBugMessage("表格 " + name + " 存在");
                    return true;
                }
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        deBugMessage("表格 " + name + " 不存在");
        return false;
    }

    /**
     * 此方法用于进入数据库
     *
     * @param statement
     * @param name
     * statement为清单实例
     * name为数据库的名字
     */

    public static void enterDatabase(Statement statement,String name)
    {
        try {
            statement.execute("USE " + name);
            deBugMessage("成功进入数据库" + name + "！");
        } catch (SQLException e) {
            e.printStackTrace();
            deBugMessage("无法进入数据库" + name + "！");
        }

    }

    /**
     * 此方法用于创建表格
     *
     * @param statement
     * @param name
     * @param Value
     * statement为清单实例
     * name为表格名字
     * Value是参数的可变集合
     *
     * 既然是创建表格，当然要给表格参数，首先，我们先检测参数是否合法
     *
     */

    public static boolean createTable(Statement statement,String name,String...Value)
    {
        if(isLegal(Value)) {
            deBugMessage("正在创建表格 " + name);

            String newValue = "";

            for (int i = 0; i < Value.length; i++) {
                newValue += Value[i];
                if (i != Value.length - 1) {
                    newValue += ",";
                }
            }

            try {
                statement.execute("CREATE TABLE if NOT EXISTS " + name + "(" + newValue + ")");
                deBugMessage("成功创建表格 " + name);
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }

    /**
     * 合法性参数集合
     */

    static String[] RegString = {"varchar","int"};

    /**
     * 此方法用于检测所给参数是否合法
     *
     * @param Value
     * Value是参数的可变集合
     */

    public static boolean isLegal(String...Value)
    {
        boolean tempB = false;
        if(Value != null)
        {
            for(String str : Value)
            {
                for(String reg:RegString)
                {
                    String[] strList = str.split(" ");
                    if (strList[1].contains(reg))
                    {
                        tempB = true;
                        break;
                    }
                    tempB = false;
                }
                if(!tempB)
                {
                    break;
                }
            }
        }

        if(tempB)
        {
            deBugMessage("参数合法！");
            return true;
        }
        else
        {
            deBugMessage("参数非法！");
            return false;
        }
    }

//    /**
//     * 此方法用于将所给参数转化为SQL语句
//     *
//     * @param Value
//     * Value是参数的可变集合
//     */
//
//    public static String changeValue(String...Value)
//    {
//        String newValue = "";
//        for(int i = 0;i < Value.length;i ++)
//        {
//            String[] strList = Value[i].split(" ");
//            if (strList[0].equals("varchar"))
//            {
//                strList[1] = "'" + strList[1] + "'";
//            }
//            Value[i] = strList[0] + " " + strList[1];
//
//            newValue += Value[i];
//            if(i != Value.length - 1)
//            {
//                newValue += ",";
//            }
//        }
//        return newValue;
//    }

    /**
     * 此方法用于向表格中插入数据
     *
     * @param statement
     * @param name
     * @param value
     * statement是数据库清单
     * name是表格名字
     * value是参数的可变集合
     */

    public static boolean insertData(Statement statement,String name,String...value)
    {
        if(value != null)
        {
            String newStr = "";
            for(int i = 0;i < value.length;i ++)
            {
                if(i != 0)
                {
                    newStr += ",";
                }
                newStr += value[i];
            }

            try {
                statement.execute("INSERT INTO " + name + " VALUE(" + newStr + ")");
                deBugMessage("已插入数据！");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
                deBugMessage("插入数据失败！");
            }
        }

        return false;
    }

    /**
     * 此方法用于得到当前使用的是那个数据库
     *
     * @param statement
     * statement是数据库清单
     *
     * @return String
     * 返回数据库的名字
     * 未使用数据库则返回Null
     */

    public static String getDataBaseName(Statement statement)
    {
        String str = null;

        try {
            ResultSet rs = statement.executeQuery("select database()");
            rs.next();
            if(!rs.getString(1).equals("Null"))
            {
                deBugMessage("已获取当前数据库名称！");
                str = rs.getString(1);
            }
            else
            {
                deBugMessage("当前没有进入任何数据库！");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return str;

    }

    /**
     * 此方法用于得到当前使用的数据库有几个表
     *
     * @param statement
     * statement是数据库清单
     *
     * @return int
     * 返回数据库的表数量
     * 未使用数据库则返回Null
     */

    public static int getDataBaseLength(Statement statement)
    {
        int i = 0;
        try {
            String databaseName = getDataBaseName(statement);
            if(databaseName != null)
            {
                ResultSet rs = statement.executeQuery("SELECT count( * ) FROM information_schema.tables WHERE TABLE_SCHEMA = '" + databaseName + "'");
                rs.next();
                i = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  i;
    }

    /**
     * 此方法用于得到指定的数据库有几个表
     *
     * @param statement
     * statement是数据库清单
     * @param name
     * name是指定数据库的名字
     *
     * @return int
     * 返回数据库的表数量
     * 未使用数据库则返回Null
     */

    public static int getDataBaseLength(Statement statement,String name)
    {
        int i = 0;
        try {
            ResultSet rs = statement.executeQuery("SELECT count( * ) FROM information_schema.tables WHERE TABLE_SCHEMA = '" + name + "'");
            rs.next();
            i = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  i;
    }

    /**
     * 此方法用于列出数据库中的表格列表
     *
     * @param statement
     * statement是数据库清单
     *
     * @return ArrayList<String>
     * 返回一个字符串集合
     */

    public static ArrayList<String> getTableList(Statement statement)
    {
        try {
            ArrayList<String> list = new ArrayList<>();
            ResultSet rs = statement.executeQuery("SHOW TABLES");

            while (rs.next())
            {
                list.add(rs.getString(1));
            }
            if(list.size() > 0)
            {
                deBugMessage("以获取数据库中的表格名称列表！");
                return list;
            }
            deBugMessage("当前数据库不存在任何表格！");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 此方法用于得到数据库中的指定的数据
     *
     * @param statement
     * @param name
     * @param value
     * statement是数据库清单
     * name是表格名字
     * value是参数的可变集合
     *
     * @return ArrayList<Object>
     * 返回一个Object集合
     */

    public static ArrayList<Object> getDate(Statement statement,String name,String...value)
    {
        if(value != null && value.length != 0)
        {
            try {
                String newStr = "";

                ResultSet resultSet = statement.executeQuery("DESC " + name);

                int number = 0;
                while (resultSet.next())
                {
                    number += 1;
                }

                for(int i = 0;i < value.length;i ++)
                {
                    String[] str = value[i].split(" ");

                    if(i != 0)
                    {
                        newStr += " AND ";
                    }
                    newStr += str[0] + "=" + str[1];
                }

                System.out.println("SELECT * FROM " + name + " WHERE " + newStr);
                resultSet = statement.executeQuery("SELECT * FROM " + name + " WHERE " + newStr);

                if(resultSet.next())
                {
                    ArrayList<Object> list = new ArrayList<>();
                    for(int i = 1;i <= number;i ++)
                    {
                        list.add(resultSet.getObject(i));
                    }
                    return list;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return null;
    }

    /**
     * 此方法用于向表格中查找所需数据是否存在
     *
     * @param statement
     * @param name
     * @param value
     * statement是数据库清单
     * name是表格名字
     * value是参数的可变集合
     *
     * @return boolean
     * 返回一个boolean类型
     * 为true则是有该信息
     * 为false则是没有该信息
     */

    public static boolean selectData(Statement statement,String name,String...value)
    {
        if(value != null && value.length != 0)
        {
            try {

//                ResultSet resultSet = statement.executeQuery("DESC " + name);
//
//                ArrayList<String> arrayList = new ArrayList<>();
//
//                while (resultSet.next())
//                {
//                    arrayList.add(resultSet.getString(1));
//                }
//                if(arrayList.size() == 0)
//                {
//                    deBugMessage("你要查找的表格没有任何信息！");
//                    return false;
//                }
//
                String newStr = "";

                for(int i = 0;i < value.length;i ++)
                {
                    String[] str = value[i].split(" ");

                    if(i != 0)
                    {
                        newStr += " AND ";
                    }
                    newStr += str[0] + "=" + str[1];

//                    if(arrayList.contains(str[0]))
//                    {
//                        newStr += str[0] + "=" + str[1];
//                    }
//                    else
//                    {
//                        deBugMessage("该表格里没有你要查找的类型！");
//                        return false;
//                    }

                }

                System.out.println("SELECT * FROM " + name + " WHERE " + newStr);
                ResultSet resultSet = statement.executeQuery("SELECT * FROM " + name + " WHERE " + newStr);

                if(resultSet.next())
                {
                    deBugMessage("查找的数据存在！");
                    return true;
                }
                else
                {
                    deBugMessage("该表格里没有你要查找的数据！");
                    return false;
                }




            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        deBugMessage("需要查找的数据为空！");
        return false;
    }

    /**
     * 此方法用于关闭传入的链接
     *
     * @param connection
     * connection是数据库链接
     */

    public static void close(Connection connection)
    {
        try {
            connection.close();
            deBugMessage("已关闭链接！");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 此方法用于关闭传入的清单
     *
     * @param statement
     * statement是数据库清单
     */

    public static void close(Statement statement)
    {
        try {
            statement.close();
            deBugMessage("已关闭清单！");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
