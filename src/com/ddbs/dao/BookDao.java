package com.ddbs.dao;

import java.util.Vector;

import com.ddbs.model.Books;

public interface BookDao {
	public boolean AddBook(Books book);
	public boolean RemoveBook(String b_id);
	public boolean ModifyBook(Books book);
	public Vector<Books> CheckAllBooks();
	public Books CheckBookById(String b_id);
}
