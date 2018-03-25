package com.muyang.service;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.List;

public class PutFile extends HttpServlet{

    public enum MuYang{
        Muse,
        Muhuang;
        int i = 50;
        public void hhhh()
        {
            System.out.println("红魔从者");
        }
    }

    public MuYang mu = MuYang.Muse;

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
//        Enumeration list = req.getParameterNames();
//        while (list.hasMoreElements())
//        {
//            System.out.println(list.nextElement());
//        }
//        System.out.println(req.getParameter("username"));
//        System.out.println(req.getParameter("File"));

        boolean isMultipart = ServletFileUpload.isMultipartContent(req);

        if(isMultipart)
        {
            System.out.println("是上传文件表单");

            mu.hhhh();
            System.out.println(mu.i);

            FileItemFactory factory = new DiskFileItemFactory();

            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List<FileItem> items = upload.parseRequest(req);
                System.out.println(items.size());
                for(FileItem di:items)
                {
                    if(!di.isFormField())
                    {
                        System.out.println("正在写入文件");

                        String fileName="G:"+ File.separator + di.getName();
                        InputStream fin=di.getInputStream();
                        FileOutputStream fout=new FileOutputStream(new File(fileName));
                        int s=0;
                        while((s=fin.read())!=-1)
                        {
                            fout.write(s);
                        }
                        fout.close();
                        fin.close();
                    }
                    else
                    {
                        System.out.println(di.getString());
                    }
                }
            }
            catch (FileUploadException e) {
                e.printStackTrace();
            }
        }
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

}
