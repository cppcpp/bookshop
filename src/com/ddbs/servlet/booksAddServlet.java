package com.ddbs.servlet;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream.GetField;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ddbs.dao.BookDao;
import com.ddbs.dao.imple.BookDaoImpl;
import com.ddbs.model.Books;

@WebServlet(name="booksAddServlet",urlPatterns={"/booksAdd"})
public class booksAddServlet extends HttpServlet{
	BookDao bd=new BookDaoImpl();
	Books book=null;
	InputStream input=null;
	OutputStream output=null;
	String book_id;
	String book_name;
	String book_description;
	float book_price;
	int book_discount;
	String book_author;
	String book_press;
	Date book_press_time;
	String book_service;
	int MAX_SIZE=1024*1024*5; 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out= response.getWriter();
		System.out.println("执行--------");
		//为解析类提供配置信息  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        //创建解析类的实例  
        ServletFileUpload sfu = new ServletFileUpload(factory);  
        //开始解析  
        sfu.setFileSizeMax(MAX_SIZE);  
        //每个表单域中数据会封装到一个对应的FileItem对象上  
        try {  
        	//parseRequest 方法解析出FORM表单中的每个字段的数据，并将它们分别包装成独立的FileItem对象，
        	//然后将这些FileItem对象加入进一个List类型的集合对象中返回
            List<FileItem> items = sfu.parseRequest(request);  
            //区分表单域  
            for (int i = 0; i < items.size(); i++) {  
                FileItem item = items.get(i);  
                //isFormField为true，表示这不是文件上传表单域  
                if(!item.isFormField()){  
                    ServletContext sctx = getServletContext();  
                    //获得存放文件的物理路径  
                    //upload下的某个文件夹   得到当前在线的用户  找到对应的文件夹  
                      
                    String path = sctx.getRealPath("/book_images");  
                    System.out.println(path);  
                    //获得文件名  
                    String fileName = item.getName();  
                    System.out.println(fileName);  
                
                    
                    input=item.getInputStream();
                    System.out.println("input:::"+input.toString());
                    File file = new File(path+"\\"+book_id+".jpg");  
                    output = new FileOutputStream(file);
                    byte[] buffer = new byte[MAX_SIZE];
    				int len = 0;
    				while ((len = input.read(buffer)) > 0) {
    					output.write(buffer);
    				}
                    if(!file.exists()){  
                    	System.out.println("file not exits");
                        item.write(file);  
                    }  
                    input.close();
                    output.close();
                }  
                
                if("book_id".equals(item.getFieldName())){
            		book_id=item.getString();
            	}
                if("book_name".equals(item.getFieldName())){
            		book_name=item.getString();
            	}
                if("book_description".equals(item.getFieldName())){
            		book_description=item.getString();
            	}
            	if("book_price".equals(item.getFieldName())){
            		String price=item.getString();
            		float fprice=Float.parseFloat(item.getString());
            		//保留两位小数
            		book_price = (float)(Math.round(fprice*100))/100;
            	}
            	if("book_discount".equals(item.getFieldName())){
            		book_discount=Integer.parseInt(item.getString());
            	}
            	if("book_author".equals(item.getFieldName())){
            		book_author=item.getString();
            	}
            	if("book_press".equals(item.getFieldName())){
            		book_press=item.getString();
            	}
            	if("book_press_time".equals(item.getFieldName())){
            		book_press_time=Date.valueOf(item.getString());
            	}
            	if("book_service".equals(item.getFieldName())){
            		book_service=item.getString();
            	}
            }  
            System.out.println(book_id+book_name+book_description+book_price+book_discount+book_author+book_press+book_service);
            book=new Books(book_id, book_name, book_description,book_price, book_discount, book_author, book_press,book_press_time, book_service);
    		boolean isAdd=bd.AddBook(book);
    		if(isAdd){
    			String cat=book.getB_id().substring(0, 1);
    			System.out.println(cat);
    			request.getSession().setAttribute("flag", "Servlet");
    			request.getRequestDispatcher("booksSearchByCat?category="+cat).forward(request, response);
    		}
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
	}
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_id=request.getParameter("book_id");
		System.out.println("b_id:::"+b_id);
		String b_name=request.getParameter("book_name");
		//获得前台的图片
		String b_pic=new String(request.getParameter("book_pic").getBytes("ISO8859-1"),"UTF-8");
		System.out.println(b_pic);
		String b_description=request.getParameter("book_description");
		float b_price=Float.parseFloat(request.getParameter("book_price"));
		//保留两位小数
		float float_price = (float)(Math.round(b_price*100))/100;
		int b_discount=Integer.parseInt(request.getParameter("book_discount"));
		String b_author=request.getParameter("book_author");
		String b_press=request.getParameter("book_press");
		String b_press_time=request.getParameter("book_press_time");
		String b_service=request.getParameter("book_service");
		//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		//Date date=sdf.parse(b_press_time);
		//java.sql.Date表示日期，只包括年月日；    对应数据库java.sql.Date
		//java.sql.Time表示时间，只包括时分秒； 		   java.sql.Time	
		//java.sql.Timestamp表示时间戳，包括年月日，时分秒，还有毫秒和纳秒；值得注意的是它比java.util.Date还多了一个纳秒。 
		Date date=Date.valueOf(b_press_time);
		System.out.println(b_id+b_name+b_description+b_price+float_price+b_discount+b_author+b_press+date+b_service);
		book=new Books(b_id, b_name, b_description,float_price, b_discount, b_author, b_press, date, b_service);
		boolean isAdd=bd.AddBook(book);
//		book.toString();
		if(isAdd){
			request.getRequestDispatcher("booksList").forward(request, response);
		}
	}*/
	
}
