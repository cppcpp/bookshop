package com.ddbs.dao.imple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.ddbs.dao.BookDao;
import com.ddbs.db.DbConn;
import com.ddbs.model.Books;
import com.ddbs.util.Page;

public class BookDaoImpl implements BookDao {
	Connection conn;
	PreparedStatement preSta;
	Statement sta;
	DbConn db = new DbConn();

	public boolean AddBook(Books book) {
		int result = 0, result2 = 0;
		conn = db.getConn();
		String sql = "insert into books(b_id,b_name,b_description,b_price,b_discount,b_author,b_press,b_press_time,b_service,b_add_time)"
				+ " values(?,?,?,?,?,?,?,?,?,?)";
		String columnName = book.getB_id() + "_o_num";
		String alter = "alter table recommend_books add " + columnName + " int(10) default 0 after u_account";
		try {
			preSta = conn.prepareStatement(sql);

			preSta.setString(1, book.getB_id());
			preSta.setString(2, book.getB_name());
			preSta.setString(3, book.getB_description());
			preSta.setFloat(4, book.getB_price());
			preSta.setInt(5, book.getB_discount());
			preSta.setString(6, book.getB_author());
			preSta.setString(7, book.getB_press());
			preSta.setDate(8, book.getB_press_time());
			preSta.setString(9, book.getB_service());
			preSta.setTimestamp(10, book.getB_add_time());
			result = preSta.executeUpdate();

			Statement statement = conn.createStatement();
			result2 = statement.executeUpdate(alter);

			if (result > 0) {
				System.out.println("插入成功");
				return true;
			}
			if (result2 > 0) {
				System.out.println("插入成功");
				return true;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			// System.out.println("添加图书异常！");
		} finally {
			db.close(preSta, conn);
		}
		return false;
	}

	public boolean RemoveBook(String b_id) {
		int result = 0;
		conn = db.getConn();
		String sql = "delete from books where b_id=?";
		try {
			preSta = conn.prepareStatement(sql);
			preSta.setString(1, b_id);
			result = preSta.executeUpdate();
			if (result > 0) {
				System.out.println("删除数据成功");
				return true;
			}
			return false;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("通过id删除book异常");
		} finally {
			db.close(preSta, conn);
		}
		return false;
	}

	public boolean ModifyBook(Books book) {
		conn = db.getConn();
		String sql = "update books set b_name=?,b_description=?,b_price=?,b_discount=?,b_author=?,b_press=?,b_press_time=?,b_service=?,b_add_time=? where b_id=?";
		try {
			preSta = conn.prepareStatement(sql);
			preSta.setString(1, book.getB_name());
			preSta.setString(2, book.getB_description());
			preSta.setFloat(3, book.getB_price());
			preSta.setInt(4, book.getB_discount());
			preSta.setString(5, book.getB_author());
			preSta.setString(6, book.getB_press());
			preSta.setDate(7, book.getB_press_time());
			preSta.setString(8, book.getB_service());
			preSta.setTimestamp(9, book.getB_add_time());
			preSta.setString(10, book.getB_id());
			int result = preSta.executeUpdate();
			if (!(result > 0)) {
				return false;
			}
			return true;
		} catch (SQLException e) {
			// e.printStackTrace();
			db.close(preSta, conn);
			System.out.println("修改图书出现异常");
		}
		return false;
	}

	public Vector<Books> CheckAllBooks() {
		conn = db.getConn();
		Vector<Books> vec = new Vector<Books>();
		Books book;
		String sql = "select * from books";
		try {
			preSta = conn.prepareStatement(sql);
			ResultSet rs = preSta.executeQuery();

			rs.getRow();
			while (rs.next()) {
				book = new Books(rs.getString("b_id"), rs.getString("b_name"), rs.getString("b_description"),
						rs.getFloat("b_price"), rs.getInt("b_discount"), rs.getString("b_author"),
						rs.getString("b_press"), rs.getDate("b_press_time"), rs.getString("b_service"),
						rs.getInt("b_sale_num"), rs.getTimestamp("b_add_time"));
				vec.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// System.out.println("查询数据异常");
		} finally {
			db.close(preSta, conn);
		}
		return vec;
	}

	public Books CheckBookById(String b_id) {
		conn = db.getConn();
		Books book = null;
		String sql = "select * from books where b_id=?";
		try {
			preSta = conn.prepareStatement(sql);
			preSta.setString(1, b_id);
			ResultSet rs = preSta.executeQuery();
			if (rs.next()) {
				book = new Books(rs.getString("b_id"), rs.getString("b_name"), rs.getString("b_description"),
						rs.getInt("b_price"), rs.getInt("b_discount"), rs.getString("b_author"),
						rs.getString("b_press"), rs.getDate("b_press_time"), rs.getString("b_service"),
						rs.getInt("b_sale_num"), rs.getTimestamp("b_add_time"));
			}
			return book;

		} catch (SQLException e) {
			e.printStackTrace();
			// System.out.println("通过id查询book异常");
		} finally {
			db.close(preSta, conn);
		}
		return book;
	}

	public Vector<Books> CheckBook(String serCon,String serInput,String cat){
		conn=db.getConn();
		Books book=null;
		String sql=null;
		Vector<Books> vec=new Vector<Books>();
		if(serCon.equals("b_name")){
			sql="select * from books where b_name like ? and b_id like ?";
		}else if(serCon.equals("b_press")){
			sql="select * from books where b_press like ? and b_id like ?";
		}else if(serCon.equals("b_author")){
			sql="select * from books where b_author like ? and b_id like ?";
		}
		
		try {
			preSta=conn.prepareStatement(sql);
			//preSta.setString(1, serCon);
			preSta.setString(1,"%"+serInput+"%");
			preSta.setString(2,"%"+cat+"%");
			ResultSet rs=preSta.executeQuery();
			
			while(rs.next()){
				book=new Books(rs.getString("b_id"),rs.getString("b_name"),rs.getString("b_description"),rs.getFloat("b_price"), rs.getInt("b_discount"), rs.getString("b_author"),rs.getString("b_press"),rs.getDate("b_press_time"),rs.getString("b_service"),rs.getInt("b_sale_num"),rs.getTimestamp("b_add_time"));
				vec.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			//搜索用户出错
			System.out.println("搜索用户出错");
			db.close(preSta, conn);
		}
		return vec;
	}


	public Map CheckBookByCat(String category, int curPage, int pageSize) {
		Vector<Books> vec = new Vector<Books>();
		conn = db.getConn();
		ResultSet rs = null;
		ResultSet rs2 = null;
		Books book = null;
		Page page = null;
		Map map = null;

		String sql = "select * from books where b_id like ?";
		try {
			preSta = conn.prepareStatement(sql);
			preSta.setString(1, "%" + category + "%");
			rs = preSta.executeQuery();
			page = new Page();
			page.setPageSize(pageSize);// 设置每页的记录数
			page.setPageCount(rs);
			page.setCurPage(curPage);
			// System.out.println("pageSize:"+page.getPageSize()+"pageCount:"+page.getPageCount()+"curpage:"+page.getCurPage());
			rs2 = page.setResultset(rs);
			rs2.previous();// 将游标移动到前一行

			for (int i = 0; i < page.getPageSize(); i++) {
				if (rs2.next()) {
					book = new Books(rs.getString("b_id"), rs.getString("b_name"), rs.getString("b_description"),
							rs.getFloat("b_price"), rs.getInt("b_discount"), rs.getString("b_author"),
							rs.getString("b_press"), rs.getDate("b_press_time"), rs.getString("b_service"),
							rs.getInt("b_sale_num"), rs.getTimestamp("b_add_time"));
					vec.add(book);
				} else {
					break;
				}
			}

			/*
			 * while(rs2.next()){ book=new
			 * Books(rs.getString("b_id"),rs.getString("b_name"),rs.getString(
			 * "b_description"),rs.getFloat("b_price"), rs.getInt("b_discount"),
			 * rs.getString("b_author"),rs.getString("b_press"),rs.getDate(
			 * "b_press_time"),rs.getString("b_service"),rs.getInt("b_sale_num")
			 * ,rs.getTimestamp("b_add_time")); vec.add(book); }
			 */
			map = new HashMap();
			map.put("vec", vec);
			map.put("page", page);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;
	}

	public List<String> ListAllCat() {
		ArrayList cat = new ArrayList();
		conn = db.getConn();
		String sql = "select b_id from books";

		return null;

	}

		//图书排序
		public Map sort(String cat,String sortCat,String whichSort,int curPage,int pageSize,int minPrice,int maxPrice){
			Vector<Books> vec=new Vector<Books>();
			conn=db.getConn();
			ResultSet rs=null;
			ResultSet rs2=null;
			Books book=null;
			Page page=null;
			Map map=null;
			
			System.out.println(cat+"++++"+sortCat+"+++"+whichSort+"+++"+curPage+"+++"+pageSize);
			String sql="select * from books where b_id like "+"\"%"+cat+"%\""+"and b_price between "+minPrice+" and "+maxPrice+" order by "+sortCat+" "+whichSort;
			System.out.println(sql);
			if(sortCat==null||whichSort==null){
				System.out.println("执行根据种类查询图书");
				map=CheckBookByCat(cat,curPage,pageSize);
				return map;
			}
			try {
				/*PreparedStatement preSta=conn.prepareStatement(sql);
				preSta.setString(1,"%"+cat+"%");
				preSta.setString(2,sortCat);
				rs=preSta.executeQuery();
				*/
				
				sta=conn.createStatement();
				rs=sta.executeQuery(sql);			
				page=new Page();
				page.setPageSize(pageSize);//设置每页的记录数
				page.setPageCount(rs);
				page.setCurPage(curPage);
				//System.out.println("pageSize:"+page.getPageSize()+"pageCount:"+page.getPageCount()+"curpage:"+page.getCurPage());
				rs2=page.setResultset(rs);
				rs2.previous();//将游标移动到前一行
				
				for(int i=0;i<page.getPageSize();i++){
					if(rs2.next()){
						book=new Books(rs.getString("b_id"),rs.getString("b_name"),rs.getString("b_description"),rs.getFloat("b_price"), rs.getInt("b_discount"), rs.getString("b_author"),rs.getString("b_press"),rs.getDate("b_press_time"),rs.getString("b_service"),rs.getInt("b_sale_num"),rs.getTimestamp("b_add_time"));
						vec.add(book);
					}else{
						break;
					}
				}
				map=new HashMap();
				map.put("vec",vec);
				map.put("page", page);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return map;		}
	// 根据锿量查找书朿
	public Map<String, Integer> selectTopBooks() {
		Map<String, Integer> resultMap = new HashMap<String, Integer>();
		conn = db.getConn();
		String sql = "select b_id,b_sale_num from books";
		System.out.println(sql);
		try {
			preSta = conn.prepareStatement(sql);
			ResultSet rs = preSta.executeQuery();
			while (rs.next()) {
				String key = rs.getString(1);
				Integer value = rs.getInt(2);
				resultMap.put(key, value);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultMap;
	}

	
	// 根据发布时间查找书本
	public Map<String, Long> selectLatestBooks() {
		Map<String, Long> resultMap = new HashMap<String, Long>();
		conn = db.getConn();
		String sql = "select b_id,b_add_time from books";
		System.out.println(sql);
		try {
			preSta = conn.prepareStatement(sql);
			ResultSet rs = preSta.executeQuery();
			while (rs.next()) {
				String key = rs.getString(1);
				Timestamp bAddTime = rs.getTimestamp(2);
				long bAddms = bAddTime.getTime();
				long currentms = System.currentTimeMillis();
				long value = currentms - bAddms;
				resultMap.put(key, value);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultMap;
	}
	
	
}
