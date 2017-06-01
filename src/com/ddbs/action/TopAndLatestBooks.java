package com.ddbs.action;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.Map.Entry;

import com.ddbs.dao.imple.BookDaoImpl;
import com.ddbs.db.DbConn;
import com.ddbs.model.Books;
import com.ddbs.servlet.booksAddServlet;

public class TopAndLatestBooks {
	BookDaoImpl bookDaoImpl = new BookDaoImpl();
	
	//根据销量
	public Vector<Books> topBooks(int num){
		DbConn dbConn = new DbConn();
		Connection connection = dbConn.getConn();
		Map<String, Integer> resultMap = bookDaoImpl.selectTopBooks();
		Map<String , Integer> tempMap = new HashMap<String, Integer>();
		Vector<Books> result = new Vector<Books>();
		
		//对集合进行排序，选出销量最高的几本书
		List<Entry<String, Integer>> sortList = new ArrayList<Entry<String, Integer>>(
				resultMap.entrySet());
		Collections.sort(sortList, new Comparator<Map.Entry<String, Integer>>() {
			
			public int compare(Entry<String, Integer> en1,
					Entry<String, Integer> en2) {
				return en2.getValue().compareTo(en1.getValue());
			}
		});
		
		int flag = 0;
		for (Entry<String, Integer> entry : sortList) {
			System.out.println("flag"+flag);
			if (flag >= num) {
				break;
			}
			Books tempBooks = bookDaoImpl.CheckBookById(entry.getKey());
			result.add(tempBooks);
			flag++;
		}
		
		return result;
	}
	
	//根据发布的时间
	public Vector<Books> latestBooks(int num){
		DbConn dbConn = new DbConn();
		Connection connection = dbConn.getConn();
		Map<String, Long> resultMap = bookDaoImpl.selectLatestBooks();
		Map<String , Long> tempMap = new HashMap<String, Long>();
		Vector<Books> result = new Vector<Books>();
		
		//对集合进行排序，选出销量最高的几本书
		List<Entry<String, Long>> sortList = new ArrayList<Entry<String, Long>>(
				resultMap.entrySet());
		Collections.sort(sortList, new Comparator<Map.Entry<String, Long>>() {
			
			public int compare(Entry<String, Long> en1,
					Entry<String, Long> en2) {
				return en1.getValue().compareTo(en2.getValue());
			}
		});
		
		int flag = 0;
		for (Entry<String, Long> entry : sortList) {
			System.out.println("flag"+flag);
			if (flag >= num) {
				break;
			}
			Books tempBooks = bookDaoImpl.CheckBookById(entry.getKey());
			result.add(tempBooks);
			flag++;
		}
		
		return result;
	}
}
