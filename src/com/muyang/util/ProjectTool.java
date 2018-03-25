package com.muyang.util;

import com.muyang.entity.Project;
import com.muyang.entity.ProjectPlan;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class ProjectTool {



    public static List<Project> getProjectList()
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

        List<Project> list = session.selectList("getProjectList");

        for(Project project : list)
        {
            project = getProjectPlan(project);
        }

        return list;


    }

    public static List<String> getProjectCodeList()
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

        List<String> list = session.selectList("getProjectCodeList");

        return list;
    }

    public static List<String> getProjectNameList()
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

        List<String> list = session.selectList("getProjectNameList");

        return list;
    }

    public static Project getProject(Project project)
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

        project = session.selectOne("getProject",project);
        project = getProjectPlan(project);
        return project;
    }

    public static Project getProjectPlan(Project project)
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

        List<ProjectPlan> list = session.selectList("getProjectPlan",project);
        project.setProjectPlanList(list);
        return project;
    }

}
