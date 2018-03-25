package com.muyang.util;

import com.muyang.entity.Diary;
import com.muyang.entity.Page;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class DiaryTool {


    public static List<Diary> getDiary(int first, int number)
    {
        String resource = "com/muyang/mybatis-config.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }

        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session=sqlSessionFactory.openSession();

        Page page = new Page();

        page.setFirst(first);
        page.setNumber(number);

        List<Diary> diaryList = session.selectList("getDiary",page);

        session.close();

        return diaryList;

    }

    public static int getDiaryListNumber(int number)
    {
        String resource = "com/muyang/mybatis-config.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }

        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session=sqlSessionFactory.openSession();

        int length = session.selectOne("getDiaryListNumber");

        int listNumber = length / number;
        if(length % number != 0)
        {
            listNumber += 1;
        }

        session.close();

        return listNumber;
    }


    public static void deleteDiary(Diary diary)
    {
        String resource = "com/muyang/mybatis-config.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }

        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session=sqlSessionFactory.openSession();

        session.delete("deleteDiaryr",diary);
        session.commit();
        session.close();

    }



}
