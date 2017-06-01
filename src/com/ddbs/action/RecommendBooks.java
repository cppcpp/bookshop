package com.ddbs.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.Map.Entry;
import java.util.TreeMap;
import com.ddbs.db.DbConn;
import com.ddbs.model.BookImages;

public class RecommendBooks {
	DbConn db = new DbConn();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection connection = db.getConn();
	String[] names = null; // names数组是用来存放userne字段的各个值
	int columnCount;// 除去u_account字段后的字段总数
	int userAmount = 0;

	// 返回被推荐的四个用户名字所组成的集合
	public Vector<BookImages> recommendBooks(String name, int recommendCount) {
		// 接受saveUserDataToMap函数返回的map，把数据库中的数据取出来放到map中
		HashMap<String, int[]> resultMap = dbAllDataToMap();
		String u_account = name;
//		System.out.println("uaccount:" + u_account);
//		System.out.println("columnCount" + columnCount);
		// 获取除了参数name之外的u_account;
		String[] otherKeys = new String[userAmount - 1];
		// 指定名字的用户数据
		int[] nameData = null;
		if (resultMap.get(u_account) != null) {
			nameData = resultMap.get(u_account);
//			System.out.println("该用户存在");
		}
		if (resultMap.get(u_account) == null) {
//			System.out.println("该用户不存在");
			return null;
		}
		// 其他用户的数据
		int[] otherData = new int[columnCount];
		// 放指定用户与其他用户空间夹角
		Map<String, Double> angles = new TreeMap<String, Double>();
		// 把不是指定用户的其他用户名取出来存到otherKeys
		int n = 0;
		for (Entry<String, int[]> entry : resultMap.entrySet()) {
			if (!(entry.getKey().equals(u_account))) {
//				System.out.print(entry.getKey());
				otherKeys[n] = entry.getKey();
//				System.out.println("n=" + n);
				n++;
			}
		}

		// 计算指定用户与其他用户之间的夹角，并存到map中
//		System.out.println("namedata lenght:" + nameData.length);
//		System.out.println("otherkeys:" + otherKeys.length);
		for (int j = 0; j < otherKeys.length; j++) {
			String tempKey = otherKeys[j];
//			System.out.println(tempKey);
			otherData = resultMap.get(tempKey);
			Double tempAngle = recommendMethod(nameData, otherData);
			angles.put(tempKey, tempAngle);
//			System.out.println("j=" + j);
		}
		// 对angles按照value进行排序
		List<Entry<String, Double>> sortList = new ArrayList<Entry<String, Double>>(
				angles.entrySet());
		Collections.sort(sortList, new Comparator<Map.Entry<String, Double>>() {
			// 升序排序，取出前四个，取出夹角小的四个，所以按照升序排序
			public int compare(Entry<String, Double> en1,
					Entry<String, Double> en2) {
				return en1.getValue().compareTo(en2.getValue());
			}
		});

		// 取出夹角最小的那个用户
		String recommendedUser = "";
		for (Entry<String, Double> entry : sortList) {
			if (entry.getValue() > 0.0000000001 && entry.getValue() > 0) {
				recommendedUser = entry.getKey();
				break;
			}
		}
//		System.out.println("recommendUser:"+recommendedUser);
		Map<String, Integer> recommendMap = columnAndData(recommendedUser);
		Map<String, Integer> uAccountMap = columnAndData(name);
		Vector<BookImages> resultData = finalResult(recommendMap, uAccountMap,
				recommendCount);
		db.close(pstmt, connection);
		return resultData;
	}

	// 计算向量之间的夹角
	public double recommendMethod(int[] a, int[] b) {
		int aLength;// 数组a,b的长度,但是两数组的长度是一致的
		int sumPointMul = 0;// 向量点乘的结果
		int aSum = 0, bSum = 0;// 向量a,b个坐标平方之和
		double resultCos;// 两向量的余弦值
		double angle;// 两向量的夹角
		aLength = a.length;
		for (int i = 0; i < aLength; i++) {
			sumPointMul += a[i] * b[i];
			aSum += Math.pow(a[i], 2);
			bSum += Math.pow(b[i], 2);
		}
		// 算出余弦值
		if (aSum == 0 || bSum == 0) {
			return -1;
		}
		resultCos = sumPointMul / (Math.sqrt(aSum) * Math.sqrt(bSum));
		// 利用反三角函数算出夹角
		angle = Math.acos(resultCos);
		return angle;
	}

	// 从数据库读取数据放到map中,把用户名设为key值存储
	public HashMap<String, int[]> dbAllDataToMap() {
		String sql = "select * from recommend_books";
		HashMap<String, int[]> userData = new HashMap<String, int[]>();
		try {
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			java.sql.ResultSetMetaData rsmd = rs.getMetaData();
			columnCount = rsmd.getColumnCount() - 1;
			// 创建n维数组，存放各用户数据
			while (rs.next()) {
				int value[] = new int[columnCount];
				// 把用户数据存在value 数组中
				for (int i = 0; i < columnCount; i++) {
					value[i] = rs.getInt(i + 2);
				}
				// 获取u_account
				String name = rs.getString(1);
//				System.out.print(":" + name);
				// 以u_account为key,value数组为值
				userData.put(name, value);
			}
			if (rs.last()) {
//				System.out.println("rs最后");
				userAmount = rs.getRow();
			}
//			System.out.println("useramount:" + userAmount);
			names = new String[userAmount];
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userData;
	}

	public Map<String, Integer> columnAndData(String userAccount) {
		String sql = "select  * from recommend_books where u_account='"
				+ userAccount + "'";
		Map<String, Integer> datasMap = new HashMap<String, Integer>();
		try {
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			java.sql.ResultSetMetaData rsmd = rs.getMetaData();
			String[] b_o_nums = new String[columnCount];
			//TODO为甚么两次的循环的初始值要相同
			for (int i = 2; i < columnCount; i++) {
				b_o_nums[i-2] = rsmd.getColumnName(i);
//				System.out.println("colunmName" + b_o_nums[i-2] + "");
			}
			while (rs.next()) {
				int value = 0;
				//TODO 为什么
				//把用户数据存在value 数组中
				for (int i = 2; i < columnCount; i++) {
//					System.out.println("b_oNums=="+b_o_nums[i]);
					value = rs.getInt(i);
					datasMap.put(b_o_nums[i-2], value);
				}
			}
//			for (Entry<String, Integer> entry : datasMap.entrySet()) {
//				System.out.print(entry.getKey() + ":" + entry.getValue() + "");
//			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return datasMap;
	}

	public Vector<BookImages> finalResult(Map<String, Integer> recommendMap,
			Map<String, Integer> uAccountMap, int recommendCount) {
		Vector<BookImages> result = new Vector<BookImages>();
		String[] resultB_ids = new String[recommendCount];
		List<Entry<String, Integer>> sortList = new ArrayList<Entry<String, Integer>>(
				recommendMap.entrySet());
		Collections.sort(sortList,
				new Comparator<Map.Entry<String, Integer>>() {
					// 升序排序，取出前四个，取出夹角小的四个，所以按照升序排序
					public int compare(Entry<String, Integer> en1,
							Entry<String, Integer> en2) {
						return en2.getValue().compareTo(en1.getValue());
					}
				});
//		System.out.println();
		int flag = 0;
		for (Entry<String, Integer> entry : sortList) {
			String key = entry.getKey();
//			System.out.println(key + "sort:" + entry.getValue() + "");
			if (flag >= recommendCount) {
				break;
			}
			if (uAccountMap.containsKey(key) && uAccountMap.get(key) == 0) {
				int index = key.lastIndexOf("_");// 判断有没有要分割的separetor字符
				String[] separetedArr = null;// 存放分割后的数组
				if (index != -1) {
					separetedArr = key.split("_");
//					for (int i = 0; i < separetedArr.length; i++) {
//						System.out.println("i="+i+","+separetedArr[i]+"");
//					}
					resultB_ids[flag] = separetedArr[0];
					flag++;
				}
				if (index == -1) {
					continue;
				}
			}
		}
//		System.out.println("flag:" + flag);
//		for (int i = 0; i < resultB_ids.length; i++) {
//			System.out.println("result"+resultB_ids[i]+"");
//			
//		}
		for (int i = 0; i < resultB_ids.length; i++) {
			String sql = "select b_id,b_img from book_images where b_id = '"
					+ resultB_ids[i] + "'";
//			System.out.println(sql);
			try {
				pstmt = connection.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					BookImages bookImages = new BookImages();
					bookImages.setB_id(rs.getString(1));
					bookImages.setB_img(rs.getString(2));
//					System.out.println("bid = " + bookImages.getB_id());
					result.add(bookImages);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
}
