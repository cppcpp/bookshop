package com.ddbs.dao.imple;

import java.awt.print.Book;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.Map.Entry;

import org.apache.catalina.tribes.util.StringManager;
import org.omg.CORBA.INTERNAL;

import com.ddbs.db.DbConn;
import com.ddbs.model.Books;

public class RecommendRelativeBooks {
	//选出本种类的所有书籍
	public Vector<Books> relativeBooks(String b_id){
		DbConn db = new DbConn();
		Connection conn = db.getConn();
		Vector<Books> books = new Vector<Books>();
		Map<String, Integer> map = new HashMap<String,Integer>();
		try {
			Statement stm = conn.createStatement();
			String sql = "select * from books where b_id like "+"\"%"+b_id+"%\"";
			System.out.println(sql);
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()){
				Books b = new Books(rs.getString(1),rs.getString(2),rs.getString(3),rs.getFloat(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getDate(8),rs.getString(10),rs.getInt(11)); 
				b.setB_add_time(new Timestamp(System.currentTimeMillis()));
				map.put(b.getB_id(), b.getB_sale_num());
			}
			//取出前四个b_id
			String a[] = getBooks(map, 6);
			for(int i = 0;i<6;i++){
				//System.out.println(a[i]);
				BookDaoImpl bookDaoImpl  = new BookDaoImpl();
				Books b = bookDaoImpl.CheckBookById(a[i]);
				books.add(b);
			}
			/*Enumeration enumeration = books.elements();
			while(enumeration.hasMoreElements()){
				Books book = (Books)enumeration.nextElement();
				System.out.println(book.getB_id());
			}*/
			return books;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	//对map进行排序  然后取出前四个数据
	public String[] getBooks(Map<String , Integer> map,int num){
		List<Entry<String, Integer>> sortList = new ArrayList<Entry<String, Integer>>(map.entrySet());
		Collections.sort(sortList, new Comparator<Map.Entry<String, Integer>>(){
			//降序排序，取出前四个
			public int compare(Entry<String, Integer> en1,Entry<String, Integer> en2){
				return en2.getValue().compareTo(en1.getValue());
			}
		});
//		for (Entry<String, Double> entry : sortList) {
//			System.out.println(entry.getKey()+":"+entry.getValue());
//		}
		//取出排好序的前四个
		int tag=0;
		String[] finalRecommendBooks = new String[num];
		for (Entry<String, Integer> entry : sortList) {
			if (tag >= num) {
				break;
			}
			finalRecommendBooks[tag] = entry.getKey();
			tag++;
		}
		return finalRecommendBooks;
	}
	
	/*//根据b_id获取整本书信息
	public Books book(String b_id){
		return null;
	}
	*/
}
