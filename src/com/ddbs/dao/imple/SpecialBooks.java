package com.ddbs.dao.imple;

import java.sql.Connection;
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

import com.ddbs.db.DbConn;
import com.ddbs.model.Books;
import com.sun.xml.internal.ws.developer.StreamingAttachment;

public class SpecialBooks {
	public Vector<Books> getSpecial(){
		DbConn db = new DbConn();
		Connection conn = db.getConn();
		Vector<Books> books = new Vector<Books>();
		Map<String, Integer> map = new HashMap<String,Integer>();
		try {
			Statement stm = conn.createStatement();
			String sql = "select * from books";
			System.out.println(sql);
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()){
				Books b = new Books(rs.getString(1),rs.getString(2),rs.getString(3),rs.getFloat(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getDate(8),rs.getString(10),rs.getInt(11)); 
				b.setB_add_time(new Timestamp(System.currentTimeMillis()));
				map.put(b.getB_id(), b.getB_discount());
			}
			/*Enumeration enumeration = books.elements();
			while(enumeration.hasMoreElements()){
				Books book = (Books)enumeration.nextElement();
				System.out.println(book.getB_id());
			}*/
//			System.out.println(map.keySet());
			
			//取出前两个b_id
			String a[] = getDiscount(map, 4);
			for(int i = 0;i<4;i++){
				//System.out.println(a[i]);
				BookDaoImpl bookDaoImpl  = new BookDaoImpl();
				Books b = bookDaoImpl.CheckBookById(a[i]);
				books.add(b);
			}
			
			Enumeration enumeration = books.elements();
			while(enumeration.hasMoreElements()){
				Books book = (Books)enumeration.nextElement();
				System.out.println(book.getB_id());
			}
			return books;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public String[] getDiscount(Map<String , Integer> map,int num){
		List<Entry<String, Integer>> sortList = new ArrayList<Entry<String, Integer>>(map.entrySet());
		Collections.sort(sortList, new Comparator<Map.Entry<String, Integer>>(){
			//降序排序，取出前四个
			public int compare(Entry<String, Integer> en1,Entry<String, Integer> en2){
				return en1.getValue().compareTo(en2.getValue());
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
}
